<script lang="ts">
	import { onMount } from 'svelte';
    import { buildPalette, applyPalette, utils } from 'image-q';
    import LoadingIndicator from './LoadingIndicator.svelte';

    let image_container;
    let loading = true;

    function img_to_canvas(img: HTMLImageElement): [HTMLCanvasElement, CanvasRenderingContext2D] {
        const canvas = document.createElement("canvas");
        const imgWidth = img.width || img.naturalWidth;
        const imgHeight = img.height || img.naturalHeight;
        canvas.height = imgHeight;
        canvas.width = imgWidth;
        const context = canvas.getContext("2d");
        if (context === null) {
            throw new Error("No canvas context??");
        }
        context.drawImage(img, 0, 0);
        return [canvas, context];
    }

    interface FilterParameters {
        red_base: number,
        red_amplitude: number,
        green_base: number,
        green_amplitude: number,
        blue_base: number,
        blue_amplitude: number,
        dither_colors: number,
    }

    async function apply_filter(params: FilterParameters, image_data: ImageData) {
        function rnd() {
            return 2 * Math.random() - 1;
        }

        console.time('noise');
        for (let i = 0; i < image_data.data.length; i += 4) {
            const randomColor1 = params.red_base + rnd() * params.red_amplitude;
            const randomColor2 = params.green_base + rnd() * params.green_amplitude;
            const randomColor3 = params.blue_base + rnd() * params.blue_amplitude;

            image_data.data[i] = image_data.data[i] * 0.99 * randomColor1;
            image_data.data[i + 1] = image_data.data[i + 1] * 0.99 * randomColor2;
            image_data.data[i + 2] = image_data.data[i + 2] * 0.99 * randomColor3;
        }
        console.timeEnd('noise');

        console.time('in_point_container');
        const inPointContainer = utils.PointContainer.fromImageData(image_data);
        console.timeEnd('in_point_container');

        console.time('palette');
        const palette = await buildPalette([inPointContainer], {
            colorDistanceFormula: 'euclidean-bt709', // optional
            paletteQuantization: 'wuquant', // optional
            colors: params.dither_colors,
        });
        console.timeEnd('palette');

        console.time('apply_palette');
        const outPointContainer = await applyPalette(inPointContainer, palette, {
            colorDistanceFormula: 'euclidean-bt709',
            imageQuantization: 'floyd-steinberg',
        })
        console.timeEnd('apply_palette');

        console.time('copy_out');
        const outData = outPointContainer.toUint8Array();
        for (let i = 0; i < image_data.data.length; i++) {
            image_data.data[i] = outData[i];
        }
        console.timeEnd('copy_out');
        }

        async function load_image(url: string): Promise<HTMLImageElement> {
        const image_blob = await (await fetch(url)).blob();
        const blob_url = URL.createObjectURL(image_blob)

        return await new Promise((resolve, reject) => {
            var image = new Image()
            image.crossOrigin = "anonymous";
            image.src = blob_url;
            image.onload = () => resolve(image);
            image.onerror = () => reject(new Error('could not load image'));
        })
    }

    async function get_filtered_pic(params: FilterParameters, url: string): Promise<HTMLCanvasElement> {
        const img = await load_image(url);

        const [canvas, context] = img_to_canvas(img);

        const image_data = context.getImageData(0, 0, canvas.width, canvas.height);
        await apply_filter(params, image_data);
        context.putImageData(image_data, 0, 0);

        return canvas;
    }

    function get_params(): FilterParameters {
        const default_params: FilterParameters = {
            red_base: 0.9,
            red_amplitude: 0.1,
            green_base: 0.7,
            green_amplitude: 0.1,
            blue_base: 0.8,
            blue_amplitude: 0.1,
            dither_colors: 16,
        };
        return default_params;
    }

    async function update_pic() {
        loading = true;
        const cute_pic = "https://cute-pics-api.dcnick3.me/";

        console.time("update_pic");
        const pic = await get_filtered_pic(get_params(), cute_pic);
        image_container.replaceChildren(pic);
        console.timeEnd("update_pic");
    }

    let promise = update_pic();

    function handleClick() {
        promise = update_pic();
    }
</script>

<div class="pic-wrapper">
    <div class="pic">
        <p style="color: #dc4cdc;">here s a cute pic:</p>
        
        <div id="pic-img-container">
            <div bind:this={image_container} style="width: 400px; height: 300px;">
            </div>
        </div>

        {#await promise}
            <LoadingIndicator />
        {/await}

        
        <!-- TODO: make button cute -->
        <button on:click={handleClick}>anothr cute pic</button>

    </div>
</div>
<style>

.pic {
    position: relative;
    border: solid 3px #dc4cdc;
    background-color: #ffc;
    padding: 5px;
}

.pic-wrapper {
    display: flex;
    flex-direction: row;
    justify-content: center;
}

.pic > p {
    margin: 0;
}

.pic-wrapper > * {
    image-rendering: pixelated;
}
</style>
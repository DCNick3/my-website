<slot />

<style global>
@font-face {
    font-family: "Comic Sans";
    src: url("/comic-sans.ttf");
} 

:root {
    font-family: Inter, Avenir, Helvetica, Arial, sans-serif;
    line-height: 24px;

    font-family: "Comic Sans MS", "Comic Sans", cursive;
    font-synthesis: none;
    text-rendering: optimizeLegibility;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    -webkit-text-size-adjust: 100%;
}

a {
    font-weight: 500;
    color: #eb02eb;
}
a:hover {
    color: #a500a5;
}

body {
    margin: 8px;
    min-width: 320px;
    min-height: 100vh;
}

#app {
    width: 100%;
}


</style>
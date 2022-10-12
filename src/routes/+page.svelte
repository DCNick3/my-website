<script lang="ts">
    import Avatar from '$lib/Avatar.svelte'
</script>

<div class="profile">
    <Avatar />
    <div class="questionnaire">
        <div class="cell id-1">
            <p><span class="q">Name: </span> nikita</p>
        </div>
        <div class="cell id-2">
            <p><span class="q">Age: </span>22 yrs old</p>
            <p><span class="q">Location: </span>innopolis</p>
        </div>
        <div class="cell id-3">
            <p><span class="q">Interests: </span> anime, programming, old tech, hiking</p>
        </div>
        <div class="cell id-4">
            <p><span class="q">Favorite anime: </span> monogatari series</p>
        </div> 
        <div class="cell id-5">
            <p><span class="q">Telegram: </span><a href="https://t.me/DCNick3">@dcnick3</a></p>
        </div>
    </div>
</div>

<style>
.profile {
  display: flex;
  padding-bottom: 15px;
}


.questionnaire {
  width: 97%;
  left: 3%;
  top: 0;
  padding: 7px;
  font-size: 13px;
  line-height: 20px;
}

.questionnaire > .cell {
  border-bottom: solid 1px #dc4cdc;
  border-top: solid 1px #dc4cdc;
  border-left: solid 3px #dc4cdc;
  border-right: solid 3px #dc4cdc;
  background-color: #ffc;
  position: relative;
}

.questionnaire > .cell.id-1 {
  border-top: solid 3px #dc4cdc;
}

.questionnaire > .cell.id-5 {
  border-bottom: solid 3px #dc4cdc;
}

.questionnaire > .cell > p {
  margin: 2px;
  margin-left: 5px;
}

.q {
  font-weight: bolder;
  color: #dc4cdc;
}
</style>
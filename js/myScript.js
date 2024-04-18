// .getElementById requires page to load first; Ensures DOM Nodes load before I do anything with them!
// "When the webpage loads, run our init function.
window.onload = (init) => {
    document.getElementById("fishy").innerHTML = "<img src=\"https://i0.wp.com/cdn.makezine.com/uploads/2008/01/plushpc.jpg?resize=500%2C333&ssl=1\" width=\"200px\">";
}

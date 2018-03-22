document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!

  const handleNewFav = (e) => {
    const favPlaceInputEl = document.getElementsByClass("favorite-input")[0];
    const favPlace = favPlaceInputEl.value;
    favPlaceInputEl.value = "";

    const favList = document.getElementById("sf-places");
    const newListItem = document.createElement("li");
    newListItem.text(`${favPlace}`);

    favList.appendChild(newListItem);

  };

  const submitButton = document.querySelector("favorite-submit");
  submitButton.addEventListener("click", handleNewFav);




  // adding new photos

  // --- your code here!



});

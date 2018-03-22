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
    e.preventDefault();

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
  const handleForm = (e) => {
    const photoForm = document.querySelector("photo-form-container");
    photoForm.classList.remove("hidden");
};

  const toggleForm = document.querySelector("photo-show-button");
  toggleForm.addEventListener("click", handleForm);

  const submitForm = (e) => {
    e.preventDefault();
  };

  const formSubmitButton = document.querySelector("photo-url-submit");
  formSubmitButton.addEventListener("click", submitForm);

});

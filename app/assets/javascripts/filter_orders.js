$(document).ready(function(){

  function toggleOrderTable(buttonID, status){
    $(buttonID).on("click", function(){
      $(status).toggleClass("hidden");
    });
  };

  toggleOrderTable("#all", "#all_orders")
  toggleOrderTable("#order", "#ordered_orders")
  toggleOrderTable("#pay", "#paid_orders")
  toggleOrderTable("#cancel", "#cancelled_orders")
  toggleOrderTable("#complete", "#completed_orders")
});

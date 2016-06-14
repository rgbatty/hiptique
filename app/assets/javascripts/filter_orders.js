$(document).ready(function(){

  function toggleOrderTable(buttonID, status){
    $(buttonID).on("click", function(){
      $(status).toggleClass("hidden");
    });
  };

  toggleOrderTable("#all", "#all_orders")
  toggleOrderTable("#ordered", "#ordered_orders")
  toggleOrderTable("#paid", "#paid_orders")
  toggleOrderTable("#cancelled", "#cancelled_orders")
  toggleOrderTable("#completed", "#completed_orders")
});

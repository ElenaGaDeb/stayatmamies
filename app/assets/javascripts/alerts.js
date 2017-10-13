// $("#alert").fadeTo(2000, 500).slideUp(500, function(){
//     $("#alert").slideUp(500);
// });
$(document).ready(function() {
  console.log("coucou");
  $(".alert-dismissible").fadeTo(2000, 500).slideUp(500, function(){
      $(".alert-dismissible").alert('close');
  });
});

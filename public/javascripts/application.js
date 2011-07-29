// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function hideShowOrg(element){

  if(element.value == "organization"){
    document.getElementById("org_name").style.display = "block";
    document.getElementById("org_list").style.display = "none";
  }else{
    document.getElementById("org_list").style.display = "block";
    document.getElementById("org_name").style.display = "none";
  }
}
$(document).ready(function() {
  setTimeout("$('.message').hide()",10000);
});
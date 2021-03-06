var img_array=["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg"];
var i=0;
function moveSlider()
{
    if(i==img_array.length)
    {
        i=0;
    }
    document.getElementById("slide").src="images/"+img_array[i];
    i++;
    window.setTimeout("moveSlider()",1000);
}
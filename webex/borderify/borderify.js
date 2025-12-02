const newDiv = document.createElement("div");
newDiv.style.position = "fixed";
newDiv.style.left = 0;
newDiv.style.top = 0;
newDiv.style.zIndex = 99999;

// document.onreadystatechange = () => {
//   if (document.readyState === "complete") {
//     document.body.appendChild(newDiv);
//     // initApplication();
//   }
// };
//
// function my_log(text) {
//   console.log(text);
//   const div = document.createElement("div");
//   div.appendChild(document.createTextNode(text));
//   newDiv.appendChild(div);
// }
//
// window.addEventListener("DOMContentLoaded", function() {
//   const scripts = document.getElementsByTagName("script");
//   my_log(`scripts: ${scripts.length}`);
//   for (const e of scripts) {
//     e.remove();
//   }
//   const iframes = document.getElementsByTagName("iframe");
//   my_log(`iframes: ${scripts.length}`);
//   for (const e of iframes) {
//     e.remove();
//   }
// });

document.documentElement.innerHTML = 'hello';

// document.body.style.border = "5px solid red";
// console.log("hello");
// const div = document.createElement('div');

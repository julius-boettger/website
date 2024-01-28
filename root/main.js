// set spacing between footer and other content dynamically
const footerMargin = 40; // pixels
const resizeFooter = () => document.body.style.marginBottom = footerMargin + document.getElementById("footer").offsetHeight + "px";
resizeFooter();
window.addEventListener("resize", resizeFooter);
// inject mail
const mail = ("juliusDOT"+"btgATproton"+"DOTme").replace(/DOT/g, ".").replace(/AT/, "@");
document.getElementById("mail-link").href = "mailto:" + mail;
document.getElementById("mail-text").innerText = mail;
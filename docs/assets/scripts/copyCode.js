const template = `
<div class="code-header">
    <button class="copy-code-button text-purple-000" aria-label="Copy code to clipboard">Copy</button>
</div>
`.trim();


document.addEventListener("DOMContentLoaded", function () {
  const codeBlocks = document.querySelectorAll('.highlighter-rouge');
  codeBlocks.forEach((codeBlock, index) => {
    const code = codeBlocks[index].innerText;
    const wrapper = document.createElement("div");
    wrapper.innerHTML = template;
    const header = wrapper.children[0];
    const copyCodeButton = header.children[0];
    codeBlock.prepend(header);

    copyCodeButton.addEventListener('click', () => {
      window.navigator.clipboard.writeText(code);
      copyCodeButton.classList.add('copied');
      copyCodeButton.innerHTML = "Copied!";
      setTimeout(() => {
        copyCodeButton.classList.remove('copied');
        copyCodeButton.innerHTML = "Copy";
      }, 2000);
    });
  });
});
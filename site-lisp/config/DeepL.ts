import puppeteer from "https://deno.land/x/pptr@1.2.0/mod.ts";

const browser = await puppeteer.launch({
  executablePath: '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome',
  headless: true
})

const page = await browser.newPage()

const content = '测试一下在线翻译服务'

await page.goto('https://www.deepl.com/translator')

await page.$eval('.lmt__target_textarea', el => el.value = '')

await page.$eval('.lmt__source_textarea', (el, content) => {
  el.value = content
}, content)

await page.type('.lmt__source_textarea', '\n')

await page.waitForFunction('document.querySelector(".lmt__target_textarea").value !== ""')

const translation = await page.$eval(".lmt__target_textarea", el => el.value.trim())

console.log(translation)

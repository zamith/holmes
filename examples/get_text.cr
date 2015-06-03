require "../src/holmes.cr"

p Holmes.parse("<h1 id='test'>Stuff</h1>").at("#test").first.text

# Appendix: Transcriber's notes

Eduard Erkes' translation
of the Heshanggong commentary
is the only academic translation
in English
that I'm aware of.
I couldn't find it online,
so I scanned a copy
and made this ebook.

The ebook was produced
by running scanned images
of the original text
through `tesseract` OCR software,
post-processing the result to markdown by hand,
and compiling the result to epub with `pandoc`.

Markdown resources and a build script are on
[GitHub](https://github.com/riverside-elvis/ho-shang-kung).

Chapter number and title
are on different lines in the original text,
but I've combined them here
so they appear together
in the table of contents.

I've reproduced the original
progressive indentation and font size reduction
of main text, commentary and Erkes' notes.
I hope it looks good
on your ebook reader.

I'm fairly sure I've transcribed
CJK characters correctly,
except perhaps for the following:

- Ch. 53 肖 - 外 in ctext
- Ch. 57 誖 - 冖 is a closed box in the original - 諱 in ctext

Where I was unable to locate
a Unicode encoding for a character,
I've replaced the missing character with □.

- Ch. 3  - 水 radical on the left with 亠 + 囗 + 日 + 羊 vertically on the right - 厚 in ctext
- Ch. 62 - 淳 with 子 as 日 + 羊 vertically - 淳 in ctext
- Ch. 64 - two horizontal components, 五 + something I can't decipher vertically on the left and 爪 + 日 vertically on the right - 伏 in ctext
- Ch. 73 - probably 糸 radical on the left with 戰 on the right - 繟 in ctext

I found a few typos along the way
and left them as-is.
If words are misspelled
according to `vim`'s all-regions dictionary,
I've at least compared misspellings
to the original text.

Except for one instance in the introduction
(where `pandoc` couldn't detect the end of the quote),
I've replaced ‘’ and “” quote characters
in the markdown
with ASCII \' and \" characters, respectively,
and let `pandoc` match and replace
start and end quotes.
A few quote marks
are mismatched in the original text,
but I've corrected them.
It's likely that single quotes
don't conform to Wade-Giles syntax.

In Erkes' notes,
what appear to be em dashes sometimes separate
supplemental information from the main note.
I've added a line break following the main note
to avoid orphaned dashes
at the ends of lines.

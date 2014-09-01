因為習慣在終端做事，加上kde的gvim有點...不好看...所以這份設定檔是為vim寫的。本人現在的層次只夠寫玩具程式，大部份功能都很少用= =" 放出來給大家笑一下。只再mint kde下運行過，如果轉換平台，至少要把konsole -e改成適合的虛擬終端。

比較常再用的功能主要是tab補全(\<C-X>\<C-P> supertab)、snipmate、自己寫的一鍵編譯(不過等開發大型專案應該就沒用了)......等等

--------------外掛----------------

大部份外掛都是經典款，稍微備註一下一些注意事項:

slmv: 有在寫lisp，所以裝了很強悍的slimv <--這個有點難裝，網路文件又少...總之要有xterm。如果運行失敗，修復錯誤後要把~/裏面一個.slimv資料夾清掉，不然就會呵呵。

vim-ruby: 我也不確定他算外掛還是gem...從github載的。需要sudo apt-get install vim-nox

vimbuddy: An absolutly useles thing. 之前出了點小問題，所以我改過他的腳本。

fuzyfinder: 記得裝l9 library外掛。

omni-complete & echofunc: 記得裝ctags就對了！！

snipmate: 想保留習慣的話，就把snippets資料夾打包帶走~~

vimtips: 文件還要上網載有點麻煩，可以的話就把plugin/vimtips/留著

-------------快捷鍵---------------

\<F1> 開lisp時映射成打開/關閉括號補全

\<F2> 全局縮排

\<F3> Tagbar(左邊)

\<F4> NERDTree(右邊)

\<F5> BufferExplorer(上方)

\<F9> 存檔後編譯、如果沒有打開qf爆錯視窗，就開啟新的konsole執行。針對C, Ruby, html, .vimrc設計。沒有對lisp的功能，因為slimv的太強大，我就不獻醜了XD

'' 開啟Conqterm bash(下方)

ff 打開FufFile

\<C-方向鍵> 多窗口間移動

\<A-左右鍵> 書籤間移動

\+ - < > 直觀調整窗口大小。如果窗口開太多，實際會如何運作我也不確定......

CC 命令模式下映射成ctags還有那一堆複雜的後綴，用來生成omni-complete和echo-func需要的標籤。不會幫你打enter，所以可以再追加其他指令，感覺靈活一點。

----------------------------------

差不多就這樣，之後想到什麼再補XDD

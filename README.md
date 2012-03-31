# Vim is swell. #

For scripting languages, I get around pretty well using vim. I don't have any mind-blowing plugins for js or py dev, but do have all this old PHP stuff, ported over from [my old bitbucket site](https://bitbucket.org/6a68), which somebody might find interesting, and which I use once in a while.

I'm looking into a really nice vim debugger for python, will update when I get something good together. In the meantime:

## vim as PHP IDE ##

I used to spend a lot of time tweaking my vim stuff when I wrote PHP, because vim was my main debugging environment. So I have some cool things for PHP editing.

*  **interactive debugging with XDebug** The value of this cannot be overestimated.
*  **CTags** if you generate a tags file using .vim/ctags-generator.sh, you can hit ctrl-[ to jump to definition of the userland class/method under the cursor, and ctrl-T to jump back.
*  **php online manual lookup** ctrl-p looks up word under cursor at php manual. Could be a reserved word, class, or function; if php.net/foo hits on the string, you'll see the response.
*  **autocomplete** ctrl-x ctrl-o, while in insert mode, displays autocomplete list of matching PHP functions, along with their parameters and parameter types at top of screen
*  **php-documentor automation** the php-documentor vim script is installed, though I reassigned the ctrl-p hotkey to manual lookup. The php-documentor script will generate docComment blocks for a function or constant or class, and extracts a surprisingly complete set of comments.

Things to be aware of:

* shortcuts to php, php -l, lynx assume a particular linux setup. These settings would have to be tweaked on win or other linux/nonstandard linux setup (this works on fairly vanilla fedora).
* a lot of this requires vim 7 or newer.
* the really cool debugger requires vim compiled with python.

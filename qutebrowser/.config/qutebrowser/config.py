
# Key bindings
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('t', 'open -t')
config.bind(';j', 'hint links spawn --detech mpv {hint-url}')
config.bind(';h', 'hint links spawn --detech streamlink -p mpv {hint-url} best')

# Change the argument to True to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# settings
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')

# User agent to send.  The following placeholders are defined:  *
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version} Edg/{upstream_browser_version}', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('colors.webpage.darkmode.enabled',True)

# Load images automatically in web pages.
config.set('content.images', True, 'chrome-devtools://*')

# Load images automatically in web pages.
config.set('content.images', True, 'devtools://*')

# Enable JavaScript.
config.set('content.javascript.enabled', True, 'chrome-devtools://*')

# Enable JavaScript.
config.set('content.javascript.enabled', True, 'devtools://*')

# Enable JavaScript.
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
config.set('content.javascript.enabled', True, 'qute://*/*')

# Search engines which can be used via the address bar.  Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
c.url.searchengines = {'DEFAULT': 'https://duckduckgo.com/?q={}', 'aw': 'https://wiki.archlinux.org/?search={}', 'awm': 'https://man.archlinux.org/search?q={}', 'cg': 'https://www.coingecko.com/en/search?query={}', 'cp': 'https://coinpaprika.com/search/?q={}', 'dbatoolsdocs': 'https://docs.dbatools.io/#{}', 'g': 'https://www.google.com/search?hl=en&q={}', 'gh': 'https://github.com/search?q={}&ref=opensearch', 'gw': 'https://wiki.gentoo.org/?search={}', 'opw': 'https://openwrt.org/doku.php?do=search&id={}', 'yt': 'https://www.youtube.com/results?search_query={}&utm_source=opensearch', 'ytm': 'https://music.youtube.com/search?q={}&utm_source=opensearch', 'zt': 'https://zoro.to/search?keyword={}'}

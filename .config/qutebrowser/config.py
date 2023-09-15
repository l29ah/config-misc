config.load_autoconfig()
config.source('redirect.py')

c.auto_save.session = True
c.session.lazy_restore = True

c.content.autoplay = False

c.colors.webpage.darkmode.enabled = True
c.colors.webpage.darkmode.increase_text_contrast = True
c.colors.webpage.darkmode.policy.images = 'never'

c.url.start_pages = 'about:blank'
c.url.default_page = 'about:blank'
c.url.searchengines = {
        'DEFAULT': 'https://paulgo.io/?q={}',
        'qw'     : 'https://lite.qwant.com/?q={}',
        'g'      : 'https://google.com/search?q={}',
        'gi'     : 'https://www.google.com/search?q={}&source=lnms&tbm=isch',
        'gh'     : 'https://github.com/search?q={}',
        'wp'      : 'https://en.wikipedia.org/?search={}',
        'yt'     : 'https://www.youtube.com/results?search_query={}',
        'yeggi' : 'https://www.yeggi.com/q/{}/',
}

c.bindings.commands['normal'] = {
        'o' : 'cmd-set-text -s :open -s',
        'O' : 'cmd-set-text :open {url:pretty}',
        'p' : 'open -s -- {primary}',
        'P' : 'open -s -t -- {primary}',
        's' : 'cmd-set-text -s :open g',
        'S' : 'cmd-set-text -s :open -t g',
        't' : 'cmd-set-text -s :open -s -t',
        'T' : 'cmd-set-text :open -s -t {url}',
        'y' : 'yank -s ;; yank',
}

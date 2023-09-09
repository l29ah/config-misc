// ==UserScript==
// @name            Redirect-free
// @author          Bga_
// @description     transform /url? /away? tracking links to real one
// @license         Creative Commons Attribution License
// @include         https://*
// @include         http://*
// @version	        0.1
// @released        2021-03-09
// @updated         2021-03-09
// @compatible      Greasemonkey
// ==/UserScript==

//# replaces redirect link to original. Simple antitracking
!(function(global) {
  const log = 1 ? ((typeof(GM_log) == "function") ? GM_log : null) || ((typeof(console) == "object" && typeof(console.log) == "function") ? function() { console.log.apply(console, arguments) } : null) || function() {  } : function() {  }
  
  const WIN1251_CODE_PAGE_HALF = "ЂЃ‚ѓ„…†‡€‰Љ‹ЊЌЋЏђ‘’“”•–— ™љ›њќћџ\xA0ЎўЈ¤Ґ¦§Ё©Є«¬\xAD®Ї°±Ііґµ¶·ё№є»јЅѕїАБВГДЕЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯабвгдежзийклмнопрстуфхцчшщъыьэюя"
  var convert8BitText = function(t, codepage) {
    return t.replace(/[\x80-\xFF]/g, function(c) {
      return codepage.charAt(c.charCodeAt(0) - 128)
    })
  }
  const parseQueryString = function(s, unescapeParam) { (unescapeParam == null) && (unescapeParam = decodeURIComponent);
    var $r = {  }
    s.split("&").forEach(function(kAndV) {
      var k = kAndV.split("=")[0]
      var v = kAndV.split("=")[1]
      $r[k] = unescapeParam(v)
    })
    return $r
  }
  
  const redirects = [
    [/^(?:https?:\/\/)?(?:www\.)?google\.(?:com|ru|co\.uk)\/url\?([\s\S]*)$/, function(match) { 
      var qso = parseQueryString(match[1])
      return qso["url"] || qso["q"]; 
    }],
    //# { "https://www.youtube.com/redirect?q=https%3A%2F%2Fwww.controllino.biz%2F&redir_token=FjbYZ_bLMLiFByycIw2lQE8QbDd8MTU2Mzg4MDQ4MUAxNTYzNzk0MDgx&event=video_description&v=0fDPBtbsUgc" }
    [/^(?:https?:\/\/)?(?:www\.)?youtube\.(?:com)\/redirect\?([\s\S]*)$/, function(match) { 
      var qso = parseQueryString(match[1])
      return qso["url"] || qso["q"]; 
    }],
    //# { "https://m.vk.com/away.php?to=https%3A%2F%2Fwww.youtube.com%2Fwatch%3Fv%3DKbQFboIEMcI&post=6666666_66" }
    [/^(?:https?:\/\/)?(?:www\.)?(?:m\.)?vk\.(?:com)\/away.php\?([\s\S]*)$/, function(match) { 
      var unescapeUtf8OrWin1251 = function(t) {
        try { 
          return decodeURIComponent(t) 
        } catch(err) {
          if(Object(err) instanceof URIError) {
            return convert8BitText(unescape(t), WIN1251_CODE_PAGE_HALF)
          }
          else {
            throw err
          }
        }
      }
      var qso = parseQueryString(match[1], unescapeUtf8OrWin1251)
      return qso["to"]; 
    }],
    [/^(?:http:\/\/)?forum\.funkysouls\.com\/go\.php\?([^&]*)/, function(match) { 
      return decodeURIComponent(match[1]); 
    }]
  ]

  // alert(1);
  log("hello from redirect-free")
  
  var onAEvent = function(ev) {
    var a = ev.target
    
    if(a.tagName != "A") return;
    
    // log("hello from redirect-free::touchstart")
    
    var href = a.getAttribute('href')
    
    if(href == null) return;
    
    if(href.match(/^http(s?)/) == null) {
      href = "".concat(location.protocol, "//", location.host, href)
    };
    1 && log("url ", href)

    const transform = function(href) {
      var j = -1, r = null; while((r = redirects[++j]) != null) {
        var match = r[0].exec(href)
        
        if(match != null) {  
          log("match ", match)
          href = r[1](match)
        };
      }
      return href
    }
    
    var origHref = href
    var oldHref
    do {
      href = transform(oldHref = href)
    } while(oldHref != href);
    
    if(href != origHref) {
      a.setAttribute("href", href)
    };
  }
  
  document.addEventListener('touchstart', onAEvent, true)
  document.addEventListener('mouseenter', onAEvent, true)
  document.addEventListener('mousedown', onAEvent, true)
  document.addEventListener('focus', onAEvent, true)
})(this)

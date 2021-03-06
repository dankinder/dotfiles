/* Configure this in your Network preferences
 * Note:
 *  SOCKS5 works for Chrome (with FoxyProxy) and Firefox
 *  SOCKS fallback works for Safari (tested under Mavericks)
 */
function FindProxyForURL(url, host) {

  if (dnsDomainIs(host, ".local")) {
    return "SOCKS5 ip-cpod1.oak.iparadigms.com:1080 ; SOCKS ip-cpod1.oak.iparadigms.com:1080 ";
  }
  return "DIRECT";
}

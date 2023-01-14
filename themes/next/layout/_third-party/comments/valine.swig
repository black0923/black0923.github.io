{%- set valine_uri = theme.vendors.valine or '//unpkg.com/valine/dist/Valine.min.js' %}

<script>
NexT.utils.loadComments(document.querySelector('#valine-comments'), () => {
  NexT.utils.getScript('{{ valine_uri }}', () => {
    var GUEST = ['nick', 'mail', 'link'];
    var guest = '{{ theme.valine.guest_info }}';
    guest = guest.split(',').filter(item => {
      return GUEST.includes(item);
    });
    // https://github.com/GamerNoTitle/Valine-Magic/tree/master/Classification/aodamiao
    const adm_emoji = {
      cdn:'https://valinecdn.bili33.top/',
      data:{
            "aodamiao1": "aodamiao/01.gif",
            "aodamiao2": "aodamiao/02.gif",
            "aodamiao3": "aodamiao/03.gif",
            "aodamiao4": "aodamiao/04.gif",
            "aodamiao5": "aodamiao/05.gif",
            "aodamiao6": "aodamiao/06.gif",
            "aodamiao7": "aodamiao/07.gif",
            "aodamiao8": "aodamiao/08.gif",
            "aodamiao9": "aodamiao/09.gif",
            "aodamiao10": "aodamiao/10.gif",
            "aodamiao11": "aodamiao/11.gif",
            "aodamiao12": "aodamiao/12.gif",
            "aodamiao13": "aodamiao/13.gif",
            "aodamiao14": "aodamiao/14.gif",
            "aodamiao15": "aodamiao/15.gif",
            "aodamiao16": "aodamiao/16.gif",
            "aodamiao17": "aodamiao/17.gif",
            "aodamiao18": "aodamiao/18.gif",
            "aodamiao19": "aodamiao/19.gif",
            "aodamiao20": "aodamiao/20.gif",
            "aodamiao21": "aodamiao/21.gif",
            "aodamiao22": "aodamiao/22.gif",
            "aodamiao23": "aodamiao/23.gif",
            "aodamiao24": "aodamiao/24.gif",
            "aodamiao25": "aodamiao/25.gif",
            "aodamiao26": "aodamiao/26.gif",
            "aodamiao27": "aodamiao/27.gif",
            "aodamiao28": "aodamiao/28.gif",
            "aodamiao29": "aodamiao/29.gif",
            "aodamiao30": "aodamiao/30.gif",
            "aodamiao31": "aodamiao/31.gif",
            "aodamiao32": "aodamiao/32.gif",
            "aodamiao33": "aodamiao/33.gif",
            "aodamiao34": "aodamiao/34.gif",
            "aodamiao35": "aodamiao/35.gif",
            "aodamiao36": "aodamiao/36.gif",
            "aodamiao37": "aodamiao/37.gif",
            "aodamiao38": "aodamiao/38.gif",
            "aodamiao39": "aodamiao/39.gif",
            "aodamiao40": "aodamiao/40.gif"
            }
    }
    const local_email = {
      cdn:'//raw.githubusercontent.com/black0923/static/main/images/Emoji/',
      data:{
        '醉了':'罗小黑战纪/醉了.gif',
        '打扫':'罗小黑战纪/打扫.gif',
      }

    }
    const returnMap = ({cdn,data})=>{
      let map = {}
      if(Array.isArray(data)){
        data.forEach(item=>map[item] = cdn + item)
        return map
      }
      for(let key in data){
        map[key] = cdn + data[key]
      }
      return map
    }
    new Valine({
      el         : '#valine-comments',
      verify     : {{ theme.valine.verify }},
      notify     : {{ theme.valine.notify }},
      appId      : '{{ theme.valine.appid }}',
      appKey     : '{{ theme.valine.appkey }}',
      placeholder: {{ theme.valine.placeholder | json }},
      avatar     : '{{ theme.valine.avatar }}',
      meta       : guest,
      pageSize   : '{{ theme.valine.pageSize }}' || 10,
      visitor    : {{ theme.valine.visitor }},
      lang       : '{{ theme.valine.language }}' || 'zh-cn',
      path       : location.pathname,
      recordIP   : {{ theme.valine.recordIP }},
      serverURLs : '{{ theme.valine.serverURLs }}',
      // emojiCDN: '',
      // // 表情title和图片映射
      emojiMaps: {
      ...returnMap(adm_emoji),
      ...returnMap(local_email),
     }
    });
  }, window.Valine);
});
</script>


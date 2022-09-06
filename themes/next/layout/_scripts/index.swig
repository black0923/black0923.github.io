{% include 'vendors.swig' %}

{{- next_js('utils.js') }}
{%- if theme.motion.enable %}
  {{- next_js('motion.js') }}
{%- endif %}

{%- set scheme_script = 'schemes/' + theme.scheme | lower + '.swig' %}
{% include scheme_script %}

{{- next_js('next-boot.js') }}
{%- if theme.bookmark.enable %}
  {{- next_js('bookmark.js') }}
{%- endif %}
{%- if theme.pjax %}
  {% include 'pjax.swig' %}
{%- endif %}
{% include 'three.swig' %}


// darkmode黑白切换js 全局配置添加时 搭配pjax配置会产生变量污染 这里添加使用pjax会缓存只会引入一次
<script src="https://unpkg.com/darkmode-js@1.5.7/lib/darkmode-js.min.js"></script>

<script>
var options = {
  bottom: '64px',
  right: 'unset',
  left: '32px',
  time: '0.5s',
  mixColor: 'transparent',
  backgroundColor: 'transparent',
  buttonColorDark: '#100f2c',
  buttonColorLight: '#fff',
  saveInCookies: true,
  label: '🌓',
  autoMatchOsTheme: true
}
const darkmode = new Darkmode(options);
window.darkmode = darkmode;
darkmode.showWidget();
</script>

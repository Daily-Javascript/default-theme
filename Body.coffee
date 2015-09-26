React = require 'react'
Nav = React.createFactory require './Nav'
require './scss/main.scss'

{ div, main, script, link } = require 'react-coffee-elements'

config = require 'config'
if config.theme.customStyles?
  require 'customStyles/' + config.theme.customStyles

module.exports = React.createClass

    displayName: 'Body'

    render: ->
        div { },
            Nav()
            main { role: 'main' }, @props.children
            script dangerouslySetInnerHTML: __html: "var disqus_shortname = 'daily-javascript';(function() {var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);})();"
            if config.theme.analyticsId?
                script type: 'text/javascript', dangerouslySetInnerHTML: __html: "(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)})(window,document,'script','//www.google-analytics.com/analytics.js','ga');ga('create', '#{config.theme.analyticsId}', 'auto');ga('send', 'pageview');"

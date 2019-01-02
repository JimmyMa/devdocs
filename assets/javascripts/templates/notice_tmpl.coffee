notice = (text) -> """<p class="_notice-text">#{text}</p>"""

app.templates.singleDocNotice = (doc) ->
  notice """ 你正在浏览 #{doc.fullName} 文档. 到
             <a href="//#{app.config.production_host}" target="_top">#{app.config.production_host}</a>浏览所有文档  (或者按 <code>esc</code>). """

app.templates.disabledDocNotice = ->
  notice """ <strong>This documentation is disabled.</strong>
             To enable it, go to <a href="/settings" class="_notice-link">Preferences</a>. """

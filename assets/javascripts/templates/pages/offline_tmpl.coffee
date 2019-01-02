app.templates.offlinePage = (docs) -> """
  <h1 class="_lined-heading">离线文档</h1>

  <div class="_docs-tools">
    <label>
      <input type="checkbox" name="autoUpdate" value="1" #{if app.settings.get('manualUpdate') then '' else 'checked'}>自动安装更新
    </label>
    <div class="_docs-links">
      <button type="button" class="_btn-link" data-action-all="install">Install all</button><button type="button" class="_btn-link" data-action-all="update"><strong>Update all</strong></button><button type="button" class="_btn-link" data-action-all="uninstall">Uninstall all</button>
    </div>
  </div>

  <div class="_table">
    <table class="_docs">
      <tr>
        <th>文档</th>
        <th class="_docs-size">大小</th>
        <th>状态</th>
        <th>操作</th>
      </tr>
      #{docs}
    </table>
  </div>

"""

canICloseTheTab = ->
  if app.AppCache.isEnabled()
    """ Yes! Even offline, you can open a new tab, go to <a href="//devdocs.io">devdocs.io</a>, and everything will work as if you were online (provided you installed all the documentations you want to use beforehand). """
  else
    """ No. AppCache isn't available in your browser (or is disabled), so loading <a href="//devdocs.io">devdocs.io</a> offline won't work.<br>
        The current tab will continue to function even when you go offline (provided you installed all the documentations beforehand). """

app.templates.offlineDoc = (doc, status) ->
  outdated = doc.isOutdated(status)

  html = """
    <tr data-slug="#{doc.slug}"#{if outdated then ' class="_highlight"' else ''}>
      <td class="_docs-name _icon-#{doc.icon}">#{doc.fullName}</td>
      <td class="_docs-size">#{Math.ceil(doc.db_size / 100000) / 10}&nbsp;<small>MB</small></td>
  """

  html += if !(status and status.installed)
    """
      <td>-</td>
      <td><button type="button" class="_btn-link" data-action="install">Install</button></td>
    """
  else if outdated
    """
      <td><strong>Outdated</strong></td>
      <td><button type="button" class="_btn-link _bold" data-action="update">Update</button> - <button type="button" class="_btn-link" data-action="uninstall">Uninstall</button></td>
    """
  else
    """
      <td>Up&#8209;to&#8209;date</td>
      <td><button type="button" class="_btn-link" data-action="uninstall">Uninstall</button></td>
    """

  html + '</tr>'

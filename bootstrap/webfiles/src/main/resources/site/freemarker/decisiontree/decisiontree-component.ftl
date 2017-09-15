<#include "../include/imports.ftl">

<#if document??>

  <div class="decisiontree">
    <#-- call the macro below -->
    <@decisiontree tree=document level=1 parentid="" />
  </div>

  <#-- this Javascript snippet will be placed at the bottom of the page-->

  <@hst.headContribution category="htmlBodyEnd" keyHint="jquery">
    <script type="text/javascript" src="<@hst.webfile path="/js/jquery-2.1.0.min.js"/>"></script>
  </@hst.headContribution>

  <@hst.headContribution category="scripts" keyHint="decisiontree">
    <script type="text/javascript">
      // for all buttons in the decision tree, handle the click event
      var $tree = $('.decisiontree');
      $tree.find('a.btn').on('click', function (e) {
        e.preventDefault();
        var $button = $(this);
        var idToShow = $button.attr('data-show-id');
        var level = $button.attr('data-level');

        console.log('show id', idToShow, 'on level', level);

        // change button color from blue to green, and reset other buttons on same level
        $tree.find('a[data-level="' + level + '"].btn-success').removeClass('btn-success').addClass('btn-primary');
        $button.removeClass('btn-primary').addClass('btn-success');

        $tree.find('div[data-level=' + level + ']').addClass('hidden');
        $tree.find('#' + idToShow).removeClass('hidden');
      });
    </script>
  </@hst.headContribution>

<#elseif editMode??>
  Click to add a decision tree
</#if>



<#macro decisiontree tree level parentid="">

  <#-- first create buttons for all children -->
  <#list tree.children>
  <div class="well">
    <#items as child>
      <a href="#" class="btn btn-primary" data-show-id="dt${parentid}_${child_index}" data-level="${level}">${child.name}</a>
    </#items>
  </div>
  </#list>

  <#-- recursively call the macro again for all children, in a hidden element -->
  <#list tree.children as child>
    <div class="hidden" id="dt${parentid}_${child_index}" data-level="${level}">
      <@decisiontree tree=child level=level+1 parentid=parentid + "_" + child_index />
    </div>
  </#list>


  <#-- if the tree item contains a link to content, render the simple content document -->
  <#if tree.content??>
    <div class="panel panel-success">
      <@hst.cmseditlink hippobean=tree.content/>
      <div class="panel-heading">
        <h3 class="panel-title">${tree.content.title?html}</h3>
      </div>
      <div class="panel-body">
        <p>${tree.content.introduction?html}</p>
        <@hst.html hippohtml=tree.content.content/>
      </div>
    </div>
  </#if>
</#macro>
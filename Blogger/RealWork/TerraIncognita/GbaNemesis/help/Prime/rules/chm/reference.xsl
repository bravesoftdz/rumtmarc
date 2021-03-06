<?xml version="1.0" encoding="windows-1251"?>
<xsl:stylesheet 
 version="1.0" 
 xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
 xmlns:msxsl="urn:schemas-microsoft-com:xslt" 
 exclude-result-prefixes="msxsl"
>

<xsl:import href="..//common//identity.xsl"/>

<xsl:output 
 method="xml"
 encoding="windows-1251"
 indent="yes"
/>

<xsl:variable name="allops" select="//operation"/>

<xsl:key name="opsKey" match="//operation" use="concat(current()/@m, '-', @key)"/>

<xsl:variable name="toolbarMain" select="msxsl:node-set($allops[@vcm_ooShowInMainToolbar and not(@id=preceding::operation/@id)])"/>


<xsl:template match="reference">
 <xsl:call-template name="summary">
  <xsl:with-param name="title" select="'����'"/>
  <xsl:with-param name="ann"   select="'��� ����, ��������� � ��������� ���������� �������. ������� ���������� - ����������.'"/>
  <xsl:with-param name="element" select="'usertype'"/>
 </xsl:call-template>

 <xsl:call-template name="summary">
  <xsl:with-param name="title" select="'��������'"/>
  <xsl:with-param name="ann"   select="'��� ��������, ��������� � ��������� ���������� �������. ������� ���������� - ����������.'"/>
  <xsl:with-param name="element" select="'entity'"/>
 </xsl:call-template>

 <xsl:call-template name="summary">
  <xsl:with-param name="title" select="'�������'"/>
  <xsl:with-param name="ann"   select="'��� �������, ��������� � ��������� ���������� �������. ������� ���������� - ����������.'"/>
  <xsl:with-param name="element" select="'operation'"/>
 </xsl:call-template>

 <xsl:call-template name="mmenu"/>

 <xsl:call-template name="summary">
  <xsl:with-param name="title" select="'������� �������'"/>
  <xsl:with-param name="ann"   select="'������� �������, ������������ ��� �������� ������ ������ ������� ��������� �������������� ��������� ����� ������� ������ ��������� F1.'"/>
  <xsl:with-param name="element" select="'shortcut'"/>
 </xsl:call-template>

</xsl:template>

<xsl:template match="application">
 <xsl:copy-of select="."/>                            
</xsl:template>

<!--                    -->
<!--    ������� ����    -->
<!--                    -->

<xsl:key 
 name="mmenuKey"
 match="//operation[@vcm_ooShowInMainMenu and @operationtype!='vcm_otShortCut']"
 use="concat(@category, '-', @key)"
/>

<xsl:variable name="mmenu"         select="$allops[@vcm_ooShowInMainMenu and @operationtype!='vcm_otShortCut']"/>
<xsl:variable name="mmenuTitle"    select="$mmenu[generate-id(.)=generate-id(key('mmenuKey', concat(@category, '-', @key)))]"/>

<xsl:template name="mmenu">

 <topic title="������� ����" id="reference-mmenu">
  <head>
   <link rel="stylesheet" type="text/css" href="mmenu.css"/>
   <script src="mmenu.js"/>
  </head>

  <text>                   

  <div class="container" onselectstart="return false">
   <div class="caption">
     <xsl:value-of select="/help/application/@title"/>&#160;

<!--     <xsl:value-of select="/help/application/@versionname"/>

 ����� � ������� ���������� ��������� �� ����� ���� 
.<xsl:value-of select="/help/application/@versionminor"/>  -->

   </div>
   <div class="mmenu">

    <xsl:for-each select="/help/application/menu/menuitem">
     <a 
      class="mButton"
      onclick="return false"
      onmouseover="buttonMouseover('{generate-id()}')"
      href=""
     >
      <xsl:value-of select="@title"/>
     </a>
    </xsl:for-each>
   </div>

   <xsl:for-each select="/help/application/menu/menuitem">
    <div 
     id="{generate-id()}"
     class="menu"
     onmouseover="menuMouseover()"
    >
     <xsl:for-each select="$mmenuTitle[@category=current()/@title]">
       <xsl:sort select="@groupid" data-type="number"/>

       <xsl:if test="@groupid and position()>1 and not(@groupid mod 100)">
        <div class="mItemSep"></div>
       </xsl:if>

       <xsl:call-template name="mmenuItem"/>
     </xsl:for-each>
    </div>
   </xsl:for-each>
 
   <xsl:call-template name="toolbar">
    <xsl:with-param name="toolbar" select="$toolbarMain"/>
    <xsl:with-param name="style"   select="'toolbarGrayR'"/>
   </xsl:call-template>

  </div>

  <br/>

  <p>
   <sel>������� ����</sel> ���������� ���������� ����, 
   ������������� � ������� ����� ���� ���������. 
   ���� ������������ ������������� �������� �������� ����
   ������� ��������� �������������� ��������� ����� ������� ������. 
   ����� �������� �������� �������, 
   ��������� ������ � ������� ������ ���� � �������� �� 
   ���� �����.
  </p>

 </text>
 </topic>


 <topic title="������� ���� (������)" id="reference-mmenu-list">
  <text>
  <p>
   ���� �������� 
   <hintn title="������� ���� ">
    - ���������� ����, ������������� � ������� ����� ���� ���������.  
   </hintn>
   ������� � ���� ������������ ������ ������.
  </p>

   <xsl:for-each select="/help/application/menu/menuitem">
 
    <a name="#{generate-id(.)}"/>
    <h3><xsl:value-of select="@title"/></h3>

    <ul style="list-style:none;">
    <xsl:for-each select="$mmenuTitle[@category=current()/@title]">
     <xsl:sort select="@groupid" data-type="number"/>

     <xsl:if test="@groupid and position()>1 and not(@groupid mod 100)">
      <li style="margin:2px;">
       <hr style="width:50%;border:1px solid gray; margin:2px;"/>
      </li>
     </xsl:if>

     <li style="margin:2px;">
      <com id="{@key}" icon="tab"/>
      <kbd><xsl:value-of select="@shortcut"/></kbd>
     </li>

    </xsl:for-each>
    </ul>
   </xsl:for-each>

  </text>
 </topic>

</xsl:template>


<xsl:template name="mmenuItem">
 <xsl:variable name="ann" select="/help/descriptions/description[@id=current()/@key]/@ann"/>
 <a 
  menu="m-{generate-id()}"
  class="mItem" 
  href="page-{@key}.htm"
  title="{$ann}&#10;&#13;�������, ����� ������� � �������� ���� �������"
 >

  <xsl:if test="@icon">
   <img src="icon/{@icon}" align="absmiddle"/>
  </xsl:if>
  <xsl:if test="not(@icon)">
   <img src="help/empty16px.gif" align="absmiddle"/>
  </xsl:if>

  <span class="mItemText">
   <xsl:value-of select="@title"/>
  </span>

<!-- 
  <xsl:if test="@operationtype='vcm_otCombo' or @operationtype='vcm_otButtonCombo' or @operationtype='vcm_otButtonPopUp'">
   <span class="mItemArrow">&#187;</span>
  </xsl:if>
-->
 </a>

</xsl:template>


<!--                 -->
<!-- UserType (����) -->
<!--                 -->

<xsl:template match="usertype">

 <xsl:variable name="toolbar" select="msxsl:node-set(../..//operation[@vcm_ooShowInChildToolbar and not(excludeusertypes/usertype/@id=current()/@id)][not(@id=preceding::operation[@f=current()/@f]/@id)])"/>

 <xsl:variable name="dsc" select="/help/descriptions/description[@id=current()/@key]"/>
 
 <topic title="{@title}" id="{@key}">

  <xsl:if test="@icon">
   <xsl:attribute name="icon">
    <xsl:value-of select="@icon"/>
   </xsl:attribute>
  </xsl:if>

  <kw name="{@title} (����)"/>
  <text>

   <table class="description" cellspacing="0">
    <tr>
    <td nowrap="true" width="1%">
     ����
    </td>
    <td width="1%">
     <xsl:choose>
      <xsl:when test="@icon">
       <img src="icon/{@icon}"/>
      </xsl:when>
      <xsl:otherwise>
       <img src="help/empty16px.gif"/>
      </xsl:otherwise>
     </xsl:choose>
    </td>
    <td width="*" nowrap="true">
     <sel><xsl:value-of select="@title"/></sel>
    </td>
    </tr>    
    
    <tr>
    <td>&#160;</td>
    <td>&#160;</td>
    <td>              
       <xsl:if test="@description!=@title">
        [<xsl:value-of select="@description"/>]
        <br/>
       </xsl:if>
       <xsl:value-of select="$dsc/@ann"/>
       <br2/>
    </td>
    </tr>

    <xsl:call-template name="listing">
      <xsl:with-param name="id" select="'elements'"/>
      <xsl:with-param name="list" select="../../entities/entity[.//operation[not(excludeusertypes/usertype/@id=current()/@id)][not(@key=preceding::operation[@f=current()/@f]/@key)]]"/>
      
      <xsl:with-param name="title">
       <hintn title="��������">
        ������ ��������� ����������, ����������� � ������ 
        ����.
       </hintn>
      </xsl:with-param>
    </xsl:call-template>


    <xsl:call-template name="listing">
      <xsl:with-param name="id" select="'operations'"/>
      <xsl:with-param name="list" select="../..//operation[not(excludeusertypes/usertype/@id=current()/@id)][not(@key=preceding::operation[@f=current()/@f]/@key)]"/>

      <xsl:with-param name="title">
       <hintn title="�������">
        �������, ����������� � ������ ����.
       </hintn>
      </xsl:with-param>
    </xsl:call-template>


    <xsl:if test="$toolbar or (@id='utMainWindow')">
     <tr>
     <td nowrap="true" valign="top">
       <hintn title="������">
        �������, �������������� �� ������ ������������ ������� ����. 
        ��������� ������ ���� � �����������, ����� �������� ������� �������� �������.
       </hintn>
     </td>
     <td>&#160;</td>
     <td>
      <xsl:if test="@id='utMainWindow'">
       <xsl:call-template name="toolbar">
        <xsl:with-param name="toolbar" select="$toolbarMain"/>
        <xsl:with-param name="style"   select="'toolbar'"/>
       </xsl:call-template>
      </xsl:if>
      <xsl:if test="@id!='utMainWindow'">
       <xsl:call-template name="toolbar">
        <xsl:with-param name="toolbar" select="$toolbar"/>
        <xsl:with-param name="style"   select="'toolbar'"/>
       </xsl:call-template>
      </xsl:if>
     </td>
     </tr>
    </xsl:if>

   </table>

   <br2/>
   <xsl:copy-of select="$dsc/*"/>

  </text>      
 </topic>

</xsl:template>


<!--          -->
<!--  ������  -->
<!--          -->


<xsl:template name="toolbar">
 <xsl:param name="toolbar"/>
 <xsl:param name="style"/>

  <div 
   class="{$style}"
   onmouseover="var e=event.srcElement;if(e.href) e.className='outset'"
   onmouseout ="var e=event.srcElement;if(e.href) e.className=''"
   onclick    ="var e=event.srcElement;if(e.href) navigate(e.href)"
   title="��������� ������ ���� � �����������, ����� ������� �������� �������."
  >

  <xsl:for-each select="$toolbar">
   <span 
    title="&quot;{@title}&quot;&#10;&#13;{/help/descriptions/description[@id=current()/@key]/@ann}"
    style="background-image: url(icon/{@icon});"
    href ="page-{@key}.htm"
   >                                      
    <xsl:choose>
     <xsl:when test="(@operationtype='vcm_otCombo') or (@operationtype='vcm_otEditCombo')">
       <xsl:attribute name="style">width:40px;background-image:url(help/ctrl_combo.gif);</xsl:attribute>
     </xsl:when>
     <xsl:when test="(@operationtype='vcm_otEdit') or (@operationtype='vcm_otTyper')">
       <xsl:attribute name="style">width:40px;background-image:url(help/ctrl_edit.gif);</xsl:attribute>
     </xsl:when>
     <xsl:when test="@operationtype='vcm_otDate'">
       <xsl:attribute name="style">width:40px;background-image:url(help/ctrl_date.gif);</xsl:attribute>
     </xsl:when>
   </xsl:choose>
    &#160;
   </span>
  </xsl:for-each>

  </div>

</xsl:template>


<!--          -->
<!-- �������� -->
<!--          -->


<xsl:template match="entity">
 <xsl:variable name="dsc" select="/help/descriptions/description[@id=current()/@key]"/>

 <topic title="{@title}" id="{@key}">

  <xsl:if test="@icon">
   <xsl:attribute name="icon">
    <xsl:value-of select="@icon"/>
   </xsl:attribute>
  </xsl:if>

  <kw name="{@title} (������� ����������)"/>
  <text>

   <table class="description" cellspacing="0">
    <tr>
    <td nowrap="true" width="1%">
     �������:
    </td>
    <td width="1%">
     <xsl:choose>
      <xsl:when test="@icon">
       <img src="icon/{@icon}"/>
      </xsl:when>
      <xsl:otherwise>
       <img src="help/empty16px.gif"/>
      </xsl:otherwise>
     </xsl:choose>
    </td>

    <td nowrap="true">
     <sel><xsl:value-of select="@title"/></sel>
    </td>
    </tr>    

    <tr>
    <td nowrap="true">��������</td>
    <td>&#160;</td>
    <td>
      <xsl:if test="@description and @description!=@title">
       <xsl:value-of select="@description"/>
      </xsl:if>

      <xsl:if test="$dsc/@ann and not(@description and @description!=@title)">
       <xsl:value-of select="$dsc/@ann"/>
      </xsl:if>
      <br2/>
    </td>
    </tr>    
    
    <xsl:call-template name="listing">
      <xsl:with-param name="id" select="'operations'"/>
      <xsl:with-param name="list" select="$allops[generate-id(.)=generate-id(key('opsKey', concat(current()/@m, '-', @key)))][@p=current()/@id]"/>

      <!--  and @m=current()/@m ������, ���� ������ �������� ����� ������ �� @id -->

      <xsl:with-param name="title">
       <hintn title="�������">
        ��������, ����������� ��� ������ ���������.
       </hintn>
      </xsl:with-param>
    </xsl:call-template>

    <xsl:call-template name="listing">
      <xsl:with-param name="id" select="'usertypes'"/>
<!--
      <xsl:with-param name="list" select="ancestor::module[1]//usertype[current()/operations/operation[not(excludeusertypes/usertype/@id=current()/@id)]][@m=current()/@m]"/>
-->
      <xsl:with-param name="list" select="ancestor::form[1]/usertypes/usertype[current()/operations/operation[not(excludeusertypes/usertype/@id=current()/@id)]]"/>

      <xsl:with-param name="title">
        <hintn title="����������� �">
         ������������� ����, � ������� ����������� ������ �������
        </hintn>
      </xsl:with-param>
    </xsl:call-template>

   </table>

   <br2/>
   <xsl:copy-of select="$dsc/*"/>

  </text>
 </topic>

</xsl:template>


<!--          -->
<!-- �������� -->
<!--          -->


<xsl:template match="operation">
 <xsl:variable name="dsc" select="/help/descriptions/description[@id=current()/@key]"/>

 <topic title="{@title}" id="{@key}">

  <xsl:if test="@icon">
   <xsl:attribute name="icon">
    <xsl:value-of select="@icon"/>
   </xsl:attribute>
  </xsl:if>

  <kw name="{@title} (�������)"/>
  
  <text>
   <table class="description" cellspacing="0">

    <tr>
    <td nowrap="true" width="1%">
     �������:
    </td>
    <td width="1%">
     <xsl:choose>
      <xsl:when test="@icon">
       <img src="icon/{@icon}"/>
      </xsl:when>
      <xsl:otherwise>
       <img src="help/empty16px.gif"/>
      </xsl:otherwise>
     </xsl:choose>
    </td>
    <td>
     <sel><xsl:value-of select="@title"/></sel>
     <xsl:if test="@shortcut">
      <kbd>
       <xsl:value-of select="@shortcut"/>
      </kbd>
     </xsl:if>

     <xsl:if test="@vcm_ooShowInMainMenu">
      [���� <com 
        id="reference-mmenu-list" 
        title="{@category}" 
        a="#{generate-id(/help/application/menu/menuitem[@title=current()/@category])}"
        hint="����� �������� ���� �������, � ������� ������ ������ �������."
       />]
     </xsl:if>

    </td>
    </tr>    

    <tr>
    <td>&#160;</td>
    <td>&#160;</td>
    <td>
       <xsl:if test="@description!=@title">
<!--
        [<xsl:value-of select="@description"/>]
        <br/>
-->
       </xsl:if>
       <xsl:value-of select="$dsc/@ann"/>
       <br2/>
    </td>
    </tr>    

    <tr>
    <td nowrap="true">
     <hintn title="���">
      ������� ����������, ����������� �������� ������ �������� 
      ���������� � ������ ������������ (���� ��� ��� ����).
     </hintn>
    </td>
    <td>&#160;</td>
    <td>

     <xsl:choose>
       <xsl:when test="@operationtype='vcm_otButton'">
        <hintn title="������">
         ������ ������ ������������.
        </hintn>
       </xsl:when>
       <xsl:when test="@operationtype='vcm_otCheck'">
        <hintn title="�������������">
         �) ������ ������ ������������, ������������ ���� ���������. 
         ������ ����� ���� �� ������ ��� ������� ����������.
         �) �������-&quot;�������&quot;.
        </hintn>
       </xsl:when>
       <xsl:when test="@operationtype='vcm_otTextButton'">
        <hintn title="������ � �������">
         ������ � ��������� ��������.
        </hintn>
       </xsl:when>
       <xsl:when test="@operationtype='vcm_otCombo'">
        <hintn title="������ ������">
         ���������� ������ ��� ������ ������ �� ���������������� 
         ��������. �� ��������� ��������������.
        </hintn>
       </xsl:when>
       <xsl:when test="@operationtype='vcm_otEditCombo'">
        <hintn title="������ ������ (�������������)">
         ���������� ������ ��� ������ ������ �� ��������. ����� ����� 
         ������ � ���������� ����������� �������.
        </hintn>
       </xsl:when>
       <xsl:when test="@operationtype='vcm_otButtonCombo'">
        <hintn title="������ � �����������">
         ������ ������ ������������ � ��������� �������� ������. 
         ������� �������� �� ������ ������������ ������������.
         
         ��� ������� �� ������� �������� ����, �� �������� ����� 
         ������� ������ ��������. ��� ������� �� ���� ������ 
         ����������� �������� �� ����� ����, �������� �� ��������� 
         (������ ������ � ������). 
         
         ����� ������ ������������ ��� ���������� ���������������� 
         ������� ������, �������� ������� ���� �� ���������� 
         ��������� ��������.
        </hintn>
       </xsl:when>
       <xsl:when test="@operationtype='vcm_otButtonPopUp'">
        <hintn title="������ ����������">
         ������ ������ ������������ � ��������� �������� ������. 
         ������� �� ������ �� ����������.
         
         ��� ������� �� ������ �������� ����, �� �������� ����� 
         ������� ������ ��������. ��������, ��������� �� ���������, 
         �� ����������.

         ����� ������ ������������ ��� ���������� ���������������� 
         ������� ������, �������� ������� ���� �� ���������� 
         ��������� ��������.
        </hintn>
       </xsl:when>
      <xsl:when test="@operationtype='vcm_otEdit'">
        <hintn title="���� �����">
         ����, ��������������� ��� ����� ������ ��� ������. ��������, 
         ��������� � ��������� ���������, ���������� ����� ������� ������� 
         Enter.
        </hintn>
       </xsl:when>
       <xsl:when test="@operationtype='vcm_otTyper'">
        <hintn title="���� ����� (� ��������)">
         ����, ��������������� ��� ����� ������. ��������, ���������  
         � �������� ���������, ����������� ���������� ��� ����� 
         ��������� ����������� ���� �����. ������� �������, ������� 
         ����������� �� ������ ��������� ������ � ����� ����.
        </hintn>
       </xsl:when>
       <xsl:when test="@operationtype='vcm_otDate'">
        <hintn title="���� ����� ����">
         ����, ��������������� ��� ����� ����. �������������� 
         ����������, ������� ���������� ������� ������.
         
         ���� ����� ������������� ����������� dd.mm.yyyy, ����������� 
         �������� ��� �� ������� � ��������� ������������ ��������� 
         ����. 
        </hintn>
       </xsl:when>
       <xsl:when test="@operationtype='vcm_otShortCut'">
        <hintn title="���������� ������">
         ���������� ������������ ������ ��� ������ ������-���� 
         ��������. �� ����� �������� ����������� ����������;        
         �� ������ ������������ �� ������������.
        </hintn>
       </xsl:when>
     </xsl:choose>
    </td>
    </tr>    

    <xsl:for-each select="//entity[operations/operation/@key=current()/@key][not(@key=preceding::entity[operations/operation/@key=current()/@key]/@key)]">
     <tr>
     <td nowrap="true">
      <xsl:if test="position()=1">
       <hintn title="����������� �">
        �������, �� ������� ��������� ������ �������.
       </hintn>
      </xsl:if>
     </td>
     <td>&#160;</td>
     <td>
      <com id="{@key}"/>
     </td>
     </tr>    
    </xsl:for-each>



   </table>

   <br2/>

   <xsl:copy-of select="$dsc/*"/>

  </text>
 </topic>
</xsl:template>



<!-- ��������������� �������  -->

<!--                    -->
<!--  ������ ���������  -->
<!--                    -->

<xsl:template name="listing">
 <xsl:param name="id"/>
 <xsl:param name="list"/>
 <xsl:param name="title"/>

 <tr>
  <td 
   nowrap="true" 
   rowspan="{count($list) + 1}" 
   valign="top"
  >
    <xsl:copy-of select="$title"/>
  </td>
  <td width="1%">
    <img src="help/empty16px.gif"/>
  </td>
  <td width="99%" 
   nowrap="true"
   onselectstart= "return false;"
   onmouseover  = "this.className = 'outset'"
   onmouseout   = "this.className=''"
   onclick="switchList(this)"
   id="{$id}"
   state="false"
   title="����� ���������: {count($list)}"
  >
  <xsl:if test="not(count($list))">
   <xsl:attribute name="disabled">true</xsl:attribute>
  </xsl:if>

   <span id="show{$id}" class="u">
     �������� <img src="help/advanced_show.gif" valign="absmiddle"/>
   </span>
   <span id="hide{$id}" class="uh">
     ������ <img src="help/advanced_hide.gif" valign="absmiddle"/>
   </span>
   </td>
 </tr>

  <xsl:for-each select="$list">
   <tr id="{$id}" class="list">
     <td>
     </td>
     <td nowrap="true">
      <com id="{@key}" icon="tab"/>
      <xsl:if test="@shortcut">
       &#160;<kbd><xsl:value-of select="@shortcut"/></kbd>
      </xsl:if>
     </td>
   </tr>
  </xsl:for-each>

</xsl:template>

<!--                              -->
<!--  ������ ���� �������� (new)  -->
<!--                              -->

<xsl:template name="summary">
 <xsl:param name="title"/>
 <xsl:param name="ann"/>
 <xsl:param name="element"/>

 <topic title="{$title}" id="{$element}_summary">

 <xsl:choose>

  <xsl:when test="$element='shortcut'">

   <text>
    <p>
     <xsl:value-of select="$ann"/>
    </p>

    <table class="description" cellspacing="1">

     <xsl:for-each select="//module[.//@shortcut]">

      <thead>
       <tr>
        <td colspan="2" class="caption">"<xsl:value-of select="@title"/>"</td>
       </tr>
      </thead>

      <xsl:for-each select=".//operation[@shortcut and not(@key=preceding::operation[@m=current()/@id]/@key)]">
       <tr>
        <td>
         <kbd><xsl:value-of select="@shortcut"/></kbd>
        </td>
        <td>
         <com id="{@key}" icon="tab"/>
        </td>
       </tr>
      </xsl:for-each>
      <tr>
       <td colspan="2">&#160;</td>
      </tr>

     </xsl:for-each>
    </table>
   </text>

  </xsl:when>

  <xsl:otherwise>

   <xsl:variable name="nodes" select="msxsl:node-set(//node()[name()=$element and @key and not(@key=preceding::node()/@key)])"/>

    <text>
     <p>
      <xsl:value-of select="$ann"/>
     </p>

     <table class="description" cellspacing="1">
      <thead>
       <tr>
        <td class="caption" colspan="2">&#160;<xsl:value-of select="$title"/></td>
       </tr>
      </thead>

      <tbody>
       <xsl:for-each select="$nodes">
        <xsl:sort select="@title"/>
        <tr>
        <td>
         <xsl:number value="position()" format="1"/>
        </td>
        <td>
         <com id="{@key}" icon="tab"/>
         <xsl:if test="name()='operation'">
          &#160;<kbd><xsl:value-of select="@shortcut"/></kbd>
         </xsl:if>
        </td>
        </tr>
       </xsl:for-each>
      </tbody>
     </table>
    </text>
    <xsl:apply-templates select="$nodes">
     <xsl:sort select="@title"/>
    </xsl:apply-templates>
  </xsl:otherwise>
 </xsl:choose>

 </topic>

</xsl:template>

<!--                           -->
<!--  ������ ���� �����������  -->
<!--                           -->

<xsl:template match="imagesList">
 <xsl:for-each select="//screen[not(@src=preceding::screen/@src)]">
  <screen src="{@src}" summary="true">
   <xsl:if test="@nopreview">
    <xsl:attribute name="nopreview">true</xsl:attribute>
   </xsl:if>
  </screen>
  <br2/><hr/><br2/>
 </xsl:for-each>
</xsl:template>

</xsl:stylesheet>

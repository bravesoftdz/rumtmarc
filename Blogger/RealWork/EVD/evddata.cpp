// !!! ��� ������������������� ����. �� ���������� ���� ������ ������ !!!

#include "ace/ACE.h"
#include "common/components/rtl/Garant/EVD/evddata.h"
// ��������� ��� ������ � ���������� �������������� ������� evd:

namespace evd {

// ����� �����:
const char* TagName[] = {
  "Handle"
, "ShortName"
, "ExternalHandle"
, "InternalHandle"
, "MDPPageID"
, "NameComment"
, "Name"
, "Pitch"
, "Size"
, "Bold"
, "Italic"
, "Underline"
, "Strikeout"
, "ForeColor"
, "BackColor"
, "Index"
, "CodePage"
, "FontParamRsr1"
, "FontParamRsr2"
, "FontParamRsr3"
, "FontParamRsr4"
, "Font"
, "Style"
, "Visible"
, "Segments"
, "Frame"
, "FrameUp"
, "FrameDown"
, "FrameLeft"
, "FrameRight"
, "Orientation"
, "Width"
, "Height"
, "FirstIndent"
, "LeftIndent"
, "Justification"
, "FixedHeight"
, "PercentSign"
, "RightIndent"
, "FirstLineIndent"
, "SpaceBefore"
, "SpaceAfter"
, "Collapsed"
, "Paras"
, "Subs"
, "IsActive"
, "StrParamRsr2"
, "StrParamRsr3"
, "StrParamRsr4"
, "CaseDocParticipants"
, "Apply2Para"
, "StyleParamRsr1"
, "IsChangeableFont"
, "VisibleToUser"
, "LineSpacing"
, "HeaderHasOwnSpace"
, "Start"
, "Finish"
, "BaseLine"
, "SegmentParamRsr2"
, "SegmentParamRsr3"
, "SegmentParamRsr4"
, "SegmentParamRsr5"
, "Text"
, "OldChildren"
, "IsPeriodic"
, "LineType"
, "Loaded"
, "AlternateText"
, "MaxTextLength"
, "PrintFontSize"
, "TextRsr4"
, "TextRsr5"
, "TextRsr6"
, "TextRsr7"
, "TextRsr8"
, "TextRsr9"
, "MaxSubID"
, "HasAnno"
, "Zoom"
, "NoCompare"
, "OldNSRC"
, "Language"
, "DPI"
, "Urgency"
, "FixedWidth"
, "AllowHyphen"
, "VerticalAligment"
, "Groups"
, "Sources"
, "Types"
, "Classes"
, "KeyWords"
, "Warnings"
, "Type"
, "UserType"
, "User"
, "DocID"
, "SubID"
, "Number"
, "Comment"
, "NumANDDates"
, "LogRecords"
, "Stages"
, "Checks"
, "Source"
, "SortDate"
, "ActiveIntervals"
, "RelExternalHandle"
, "Priority"
, "PublishedIn"
, "Prefix"
, "Territory"
, "Alarms"
, "Norm"
, "ExternalPath"
, "LinkedDocuments"
, "Flags"
, "Object"
, "Bitmap"
, "PriceLevel"
, "URL"
, "Headers"
, "Footers"
, "MergeStatus"
, "AccGroups"
, "RelInternalHandle"
, "AutoClasses"
, "Weight"
, "InternalVerLink"
, "ExternalVerLink"
, "AnnoClasses"
, "Bullet"
, "Time"
, "TabStops"
, "Revision"
, "ContentsLevel6"
, "ContentsLevel5"
, "Pages"
, "LinkComment"
, "Private"
, "Value"
, "Enabled"
, "Valid"
, "Upper"
, "StateIndex"
, "Flat"
, "ImageIndex"
, "Script"
, "CardType"
, "ReqID"
, "Required"
, "NumList"
, "InternalNextVerLink"
, "FilterType"
, "ModelControl"
, "Multy"
, "ReqKind"
, "SysLogRecords"
, "Versions"
, "ExternalNextVerLink"
, "ServiceInfo"
, "InContents"
, "CompareContentsLevel"
, "ViewKind"
, "LinkAddress"
, "Children"
, "Formatted"
, "LimitWidth"
, "DeltaX"
, "DeltaY"
, "Map"
, "MaxHyperlinkHandle"
, "ExcludeSuper"
, "LayerID"
, "StateCount"
, "AllChildrenCount"
, "Rubber"
, "NodeVisibleIndex"
, "DefaultText"
, "DefaultNode"
, "Modified"
, "Operations"
, 0
}; // TagName

// ����� �����:
const char* TypeName[] = {
  "Empty"
, "Long"
, "Enum"
, "Bool"
, "Color"
, "String"
, "Object"
, "Justification"
, "Rsr2"
, "l3Base"
, "Tag"
, "DocumentSub"
, "Segment"
, "TextSegment"
, "HyperLink"
, "Sub"
, "List"
, "SubLayer"
, "DocSubLayer"
, "SegmentsLayer"
, "Document"
, "Para"
, "TextPara"
, "ParaList"
, "Table"
, "SBS"
, "TableRow"
, "TableColumn"
, "Handle"
, "Inch"
, "OList"
, "Position"
, "ObjectWithHandle"
, "SgLHandle"
, "SbLHandle"
, "FontName"
, "Font"
, "PercentSign"
, "Style"
, "TextStyle"
, "FramePart"
, "Frame"
, "Rsr3"
, "Rsr4"
, "Reserved6"
, "Reserved2"
, "NodeGroup"
, "Cloak"
, "DictEntryBlock"
, "DictEntry"
, "Block"
, "ObjectSegment"
, "SimpleDocumentTextPara"
, "TableTextPara"
, "AnnoTopic"
, "ReqGroup"
, "TextRsr4"
, "TextRsr5"
, "TextRsr6"
, "TextRsr7"
, "TextRsr8"
, "TextRsr9"
, "TextRsr10"
, "TextRsr11"
, "TextRsr12"
, "TextRsr13"
, "TextRsr14"
, "TextRsr15"
, "TextRsr16"
, "TextRsr17"
, "TextRsr18"
, "TextRsr19"
, "DecorTextPara"
, "DictItem"
, "DictRec"
, "Date"
, "Type"
, "Address"
, "LogRecord"
, "StagePrim"
, "Stage"
, "Check"
, "NumANDDate"
, "TinyDocument"
, "ActiveInterval"
, "Alarm"
, "AutoClass"
, "DictItemEx"
, "PIRec"
, "NSRCTag"
, "Participant"
, "NSRCRsr0"
, "NSRCRsr1"
, "NSRCRsr2"
, "NSRCRsr3"
, "NSRCEnd"
, "RawData"
, "BitmapPara"
, "IUnknown"
, "HFParent"
, "Header"
, "Footer"
, "Division"
, "PageBreak"
, "SectionBreak"
, "SimpleDocument"
, "PageProperties"
, "TreePara"
, "SBSRow"
, "SBSCell"
, "Formula"
, "Bullet"
, "LogRecordPrim"
, "Time"
, "TabStop"
, "Bookmark"
, "Mark"
, "LeafPara"
, "StyledLeafPara"
, "ControlPara"
, "CommentPara"
, "ControlsBlock"
, "XML"
, "XMLTag"
, "TagName"
, "Attr"
, "AttrName"
, "AttrValue"
, "TagBody"
, "QueryCard"
, "ReqRow"
, "ReqCell"
, "ExtDataPara"
, "ContentsElement"
, "LeafParaDecorationsHolder"
, "AutoreferatDocument"
, "Version"
, "ImageListBitmap"
, 0
}; // TypeName

} // namespace


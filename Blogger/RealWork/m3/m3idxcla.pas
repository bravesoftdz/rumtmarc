unit m3IdxCla;
{* ���������� ��������� ����������� �����������. }

(*
//
//
// .Author: Mickael P. Golovin.
// .Copyright: 1997-2001 by Archivarius Team, _free for non commercial use.
//
//
*)
// $Id: m3idxcla.pas,v 1.17 2013/04/12 16:25:08 lulin Exp $

// $Log: m3idxcla.pas,v $
// Revision 1.17  2013/04/12 16:25:08  lulin
// - ���������� ��� XE3.
//
// Revision 1.16  2012/11/01 09:43:31  lulin
// - ����� ����� � �������.
//
// Revision 1.15  2012/11/01 07:45:58  lulin
// - ������ ����������� ����������� �������� �������� �������.
//
// Revision 1.14  2012/01/19 11:17:19  lulin
// {RequestLink:327821495}
//
// Revision 1.13  2011/12/28 09:29:10  lulin
// {RequestLink:325257155}
// - ������ ���.
//
// Revision 1.12  2011/05/19 10:36:12  lulin
// {RequestLink:266409354}.
//
// Revision 1.11  2010/11/30 11:47:20  lulin
// {RequestLink:228688602}.
// - ������ � ����������������.
//
// Revision 1.10  2009/07/21 15:10:22  lulin
// - bug fix: �� ��������� � �� ������� ���������� � �����.
//
// Revision 1.9  2009/03/19 16:28:30  lulin
// [$139443095].
//
// Revision 1.8  2008/02/29 08:24:14  lulin
// - bug fix: �� ��������� ����������.
//
// Revision 1.7  2007/02/19 15:20:03  lulin
// - bug fix: �� ��������� ����������.
//
// Revision 1.6  2005/05/24 11:07:42  lulin
// - cleanup.
//
// Revision 1.5  2005/04/28 15:04:14  lulin
// - ��������� ����� B_Tag_Box � HEAD.
//
// Revision 1.4.4.1  2005/04/26 14:30:59  lulin
// - �������� l3Free � _l3Use.
//
// Revision 1.4  2005/02/14 15:12:01  lulin
// - �������� ��������� �������.
//
// Revision 1.3  2004/11/03 17:30:28  voba
// - bug fix: �� ���������������.
//
// Revision 1.2  2004/09/21 11:22:27  lulin
// - Release ������� �� Cleanup.
//
// Revision 1.1  2004/09/02 08:09:49  law
// - cleanup.
//
// Revision 1.49  2004/08/18 12:27:24  law
// - ������� ��������� m4BuildIndexNew �� ������������� m3IterateDocuments.
//
// Revision 1.48  2004/06/02 14:45:56  law
// - rename method: Tk2BaseStackGenerator.Atom2String -> VariantAsString.
// - ������ ������ ��� ����� ���������� � ���������� �� �������� � ��������� _1252.
//
// Revision 1.47  2004/06/01 07:41:54  law
// - ���������� (���������� ��������� �� ��������� ������) ���������� �� ������������ ������ � ������ ����������.
//
// Revision 1.46  2003/07/30 16:34:24  law
// - change: ������� �������� ���������� �� ���� ���������� ������� ������ ���������� ������.
//
// Revision 1.45  2003/06/26 11:31:44  law
// - bug fix: �������� �������� ������������� Tm3LiveSearcherResult - ��� ��� ��� ������ ���� ���������� ���� �� ��������� �� ������� ���� ������� �����.
//
// Revision 1.44  2003/02/19 14:11:13  law
// - new class: Tm3LiveSearcherResult.
//
// Revision 1.43  2002/09/05 12:54:49  voba
// - bug fix: ��� ������ ���� � ������.
//
// Revision 1.42  2002/09/05 12:42:43  law
// - bug fix: �� ������ �������� ��������� � ������.
//
// Revision 1.41  2002/09/04 13:11:13  law
// - cleanup.
//
// Revision 1.40  2002/09/04 13:06:18  law
// - change proc: m2MSKCompare -> l3MaskCompare.
//
// Revision 1.39  2002/06/17 13:44:46  law
// - new const: m3_saRead, m3_saReadWrite, m3_saCreate.
//
// Revision 1.38  2002/04/25 12:46:15  law
// - optimization.
//
// Revision 1.37  2002/04/25 10:55:10  law
// - optimization: ������� ��������� ����� ������.
//
// Revision 1.36  2002/04/25 10:48:02  law
// - cleanup.
//
// Revision 1.35  2002/04/25 10:26:54  law
// - bug fix: ������������ ������� ��������� ���������.
// - cleanup: ����������������� ������� ������.
//
// Revision 1.34  2002/04/17 11:55:27  law
// - class alias: Tm3Hash = Tm3HashHandleList.
//
// Revision 1.33  2002/04/17 08:20:57  law
// - new behavior: ��������� ������ ������ ���������������� ��� �������� ����.
//
// Revision 1.32  2002/04/15 14:29:23  law
// - change: ������� ����������� �������� ����� �������� �������� ���������� � ����� �������.
//
// Revision 1.31  2002/04/15 12:20:21  law
// - new method: GetFlags.
//
// Revision 1.30  2002/04/12 11:31:13  law
// - cleanup.
//
// Revision 1.29  2002/04/11 14:35:43  law
// - new param: UseAlternate.
// - new method: IsAlternate.
//
// Revision 1.28  2002/04/05 12:53:07  law
// - change: �������� ��������� Im3IndexedStorage.
//
// Revision 1.27  2002/04/01 16:04:32  law
// - bug fix: ��������� ������ �������� ������.
//
// Revision 1.26  2002/03/28 16:51:12  law
// - bug fix: ������������ ������� � ��������� ��������.
//
// Revision 1.25  2002/03/18 16:49:14  law
// - new directive: m3UseSTSorter.
//
// Revision 1.24  2002/03/11 15:51:35  law
// - new behavior: ������� �������� �������� �������.
//
// Revision 1.23  2002/03/11 15:09:37  law
// - new directive: m3MultiThreadIndex.
//
// Revision 1.22  2002/03/04 09:59:37  law
// - new behavior: �������� ��������� �������� �������.
//
// Revision 1.21  2002/02/28 14:23:08  law
// - new behavior: �� ������� ����� �������� ����.
//
// Revision 1.20  2002/02/27 17:06:24  law
// - optimization: ������� ����������� ����� ���������� ��������� ������, ����������� ������� �����.
//
// Revision 1.19  2002/02/26 15:48:10  law
// - optimization: ������� ����������� ����� ���������� ������������ ���������� ������.
//
// Revision 1.18  2002/02/26 08:31:54  law
// - new method: Im3NormalizaterResult.Reset.
// - bug fix: Catastrophic Fail ��� �������� �������.
//
// Revision 1.17  2002/02/22 10:30:53  law
// - optimization: ���������� ��������� Im3IndexedStorage.
//
// Revision 1.16  2002/02/21 15:58:16  law
// - optimization.
//
// Revision 1.15  2002/02/20 15:43:29  law
// - new behavior: �������� �������������� ��������� ������ ������������.
//
// Revision 1.14  2002/01/30 14:24:04  law
// - new interface: Im3IndexedStorage.
//
// Revision 1.13  2002/01/29 12:51:54  law
// - new behavior: ������ ������ � ���� �� �������.
//
// Revision 1.12  2002/01/17 18:41:33  law
// - new behavior: ������ ������ Tm3BaseHandleList ����� ������� �� Tl3VList.
//
// Revision 1.11  2001/12/26 14:28:32  law
// - reformatting.
//
// Revision 1.10  2001/12/26 13:33:41  law
// - new behavior: ������� ��������� ����� ����� ��������� ���������.
//
// Revision 1.9  2001/12/24 14:44:57  voba
// - bug fix: ���������� ����� ���������� � �����������.
//
// Revision 1.8  2001/12/21 13:12:42  law
// - new behavior: ������ ����� � ������ ����� * � ?.
//
// Revision 1.7  2001/12/03 15:07:10  law
// - cleanup: ���������������� �������� �����.
//
// Revision 1.6  2001/12/03 08:39:35  law
// - bug fix: �� ������� ������ �� ����������� �����.
//
// Revision 1.5  2001/11/29 15:46:17  law
// - bug fix: ���������� ������������ ��������� ����������� ����� ������������� ������������� �������. ��������� �����. ���� �� ��������.
//
// Revision 1.4  2001/11/21 13:18:30  law
// - bug fix: �������� �� ��� ������������������ �����.
//
// Revision 1.3  2001/11/20 09:12:36  law
// - comments: xHelpGen.
//
// Revision 1.2  2001/11/20 07:37:28  law
// - comments: xHelpGen.
//

 {$I m3Define.inc}

interface


uses
         Windows,
        SysUtils,

         ActiveX,
          COMObj,
  Classes,

         l3Types,
          l3Base,
  l3Memory,
  l3Interfaces,
  l3SimpleMM,

        m2AddPrc,
        m2S32Lib,
        m2DTFLib,
        m2MEMLib,
        m2HASLib,
        m2COMLib,

  m3StorageInterfaces,
        m3BasCla,
        m3StgMgr,
        m3SorInt,
        m3IdxInt;


type
        Tm3BranchHandlePrim=      class;
        Tm3BranchHandle=          class;
        Rm3BranchHandle = class of Tm3BranchHandle;
        Tm3BranchHandleList=      class;
        Tm3HashHandle=            class;
        Tm3HashHandleList=        class;
        Tm3HashInfoStream=        class;
        Tm3IndexUpdater=          class;
        Tm3IndexSearcher=         class;
        Tm3IndexSearcherResult=   class;
        Tm3IndexStorageManager=   class;
        Tm3Normalizater=          class;
        Tm3NormalizaterResult=    class;


        Tm3IdxClaBranchItem=      packed array [$0000..$ffff] of AnsiChar;

        Pm3IdxClaUpdateItem=      ^Tm3IdxClaUpdateItem;
        Tm3IdxClaUpdateItem=      packed record
                                   BranchHandle : Tm3BranchHandlePrim;
                                   BranchItem   : Tm3IdxClaBranchItem;
                                  end;

        Tm3IdxClaSearchInfo=      packed record

                                   RStream: IStream;
                                   RItem: Pointer;

                                   RNeedLoad: LongBool;

                                  end;

        Tm3IdxClaSearchInfoArray= packed array of Tm3IdxClaSearchInfo;


        Tm3IdxClaBranchHandles=   packed array of Tm3BranchHandlePrim;


  Tm3BranchHandlePrim = class(Tm3BaseListHandle)
    public
    // public fields
      Data : packed record
        Hash  : Word;
        Value : PWideChar;
      end;//Data
    protected
    // internal methods
      class function IsCacheable : Boolean;
        override;
        {-}
      class function AllocInstanceMem: TObject;
        override;
        {-}
      procedure FreeInstanceMem;
        override;
        {-}
    public
    // public methods
      procedure AssignHandle(const anItem: Tm3BaseListHandle);
        override;
        {-}
  end;//Tm3BranchHandlePrim
  Pm3BranchHandlePrim = ^Tm3BranchHandlePrim;

  Tm3BranchHandle = class(Tm3BranchHandlePrim)
    public
    // public fields
      NormalForms : Pm3BranchHandlePrim;
    public
    // public methods
      procedure AssignHandle(const anItem: Tm3BaseListHandle);
        override;
        {-}
  end;//Tm3BranchHandle


  Tm3BranchHandleList = class(Tm3BaseHandleList)
    protected
    // internal methods
      procedure AllocItem(var AItem: Pointer);
        override;
        {-}
      function  CompareKeyByItem(const AKey  : Pointer;
                                 const AItem : Pointer): Integer;
        override;
        {-}
    public
    // public methods
      function  BinSearchByKey(const AValue : WideString;
                               var   AIndex : LongInt): LongBool;
        overload;
        {-}
      function  BinSearchByKey(aValue       : PWideChar;
                               aLength      : Long;
                               var   AIndex : LongInt): LongBool;
        overload;
        {-}
  end;//Tm3BranchHandleList


  Tm3HashHandle = class(Tm3BaseListHandle)
    public
    // public fields
      Data : packed record
        BranchHandleList: Tm3BranchHandleList;
      end;//Data
    public
    // public methods
      constructor Create;
        {-}
      procedure Cleanup;
        override;
        {-}
      procedure AssignHandle(const AItem: Tm3BaseListHandle);
        override;
        {-}
  end;//Tm3HashHandle

  Tm3SearchWordFlag = (m3_swfNew, m3_swfPseudo, m3_swfAlternate, m3_swfError);
  Tm3SearchWordFlags = set of Tm3SearchWordFlag;
  Pm3SearchWordFlags = ^Tm3SearchWordFlags;

  Tm3HashHandleList = class(Tm3BaseHandleList)
    private
      _Status:                LongWord;
    private
    // internal methods
          function          InitProc00000001    (const ABitMask: LongWord;
                                                 const AHashCount: Word
                                                ): LongWord;

          procedure         DoneProc00000001    (
                                                );


          function          InitProc00000002    (const ABitMask: LongWord;
                                                 const AHashSize: LongInt
                                                ): LongWord;

          procedure         DoneProc00000002    (
                                                );


          function          InitProc00000004    (const ABitMask: LongWord;
                                                 const AHashVersion: Word
                                                ): LongWord;

          procedure         DoneProc00000004    (
                                                );


          function          InitProc00000008    (const ABitMask: LongWord
                                                ): LongWord;

          procedure         DoneProc00000008    (
                                                );


    private
      FHashCount:             Word;
      FHashSize:              LongInt;
      FHashVersion:           Word;
      f_ExHandleClass : Rm3BranchHandle;        
    protected
      class function          MakeHash            (const AValue: WideString;
                                                   const AHashCount: Word;
                                                   const AHashSize: LongInt;
                                                   const AHashVersion: Word
                                                  ): Word;


          procedure         AllocItem           (var   AItem: Pointer
                                                ); override;

    public


          constructor       Create              (anExHandleClass : Rm3BranchHandle = nil;
                                                 const AHashCount: Word = Cm2HASDefCount;
                                                 const AHashSize: LongInt = Cm2HASDefSize;
                                                 const AHashVersion: Word = Cm2HASVersion
                                                );

          procedure Cleanup;
            override;
            {-}


      function SearchBranchHandle(const AValue        : WideString;
                                  const ANormalizater : Im3Normalizater;
                                  theFlags            : Pm3SearchWordFlags = nil): Tm3BranchHandlePrim;
        {-}                          
  end;//Tm3HashHandleList

  Tm3Hash = Tm3HashHandleList;

        Tm3HashInfoStream=        class(Tm3CustomHeaderStream)
         private


         protected


                function          InitHeaderData      (
                                                      ): Pointer; override;

                function          InitHeaderDataSize  (
                                                      ): LongInt; override;

                function          InitHeaderFullSize  (
                                                      ): LongInt; override;


         public


          class function          HeaderID            (
                                                      ): TCLSID; override;


         end;


        Tm3IndexUpdater = class(Tm3BaseClass, Im3IndexUpdater, Il3ProgressSource)
         {* ����������� �������. }
         private


          _Status:                LongWord;


                function          InitProc00000001    (const ABitMask: LongWord;
                                                       const AIndexStorageManager: Im3IndexStorageManager
                                                      ): LongWord;

                procedure         DoneProc00000001    (
                                                      );


                function          InitProc00000002    (const ABitMask: LongWord;
                                                       const AIndexComparer: Im3IndexComparer
                                                      ): LongWord;

                procedure         DoneProc00000002    (
                                                      );


                function          InitProc00000004    (const ABitMask: LongWord;
                                                       const AIndexReader: Im3IndexReader
                                                      ): LongWord;

                procedure         DoneProc00000004    (
                                                      );


                function          InitProc00000008    (const ABitMask: LongWord;
                                                       const AIndexWriter: Im3IndexWriter
                                                      ): LongWord;

                procedure         DoneProc00000008    (
                                                      );


                function          InitProc00000010    (const ABitMask: LongWord;
                                                       const ANormalizater: Im3Normalizater
                                                      ): LongWord;

                procedure         DoneProc00000010    (
                                                      );


                function          InitProc00000020    (const ABitMask: LongWord;
                                                       const AItemSize: LongInt
                                                      ): LongWord;

                procedure         DoneProc00000020    (
                                                      );


                function          InitProc00000040    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000040    (
                                                      );


                function          InitProc00000100    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000100    (
                                                      );


                function          InitProc00000200    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000200    (
                                                      );


                function          InitProc00000400    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000400    (
                                                      );


                function          InitProc00000800    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000800    (
                                                      );


                function          InitProc00001000    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00001000    (
                                                      );


                function          InitProc00002000    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00002000    (
                                                      );


         private


          {$IfDef m3MultiThreadIndex}
          FRTLCriticalSection:    TRTLCriticalSection;
          {$EndIf m3MultiThreadIndex}

          FItemSize:              LongInt;

          FIndexStorageManager:   Im3IndexStorageManager;

          FIndexComparer:         Im3IndexComparer;

          FIndexReader:           Im3IndexReader;
          FIndexWriter:           Im3IndexWriter;

          FNormalizater:          Im3Normalizater;

          FSorter:                Im3Sorter;

          FRootStorage:           Im3IndexedStorage;

          FHashInfoStream:        Tm3HashInfoStream;

          FStopListStorage:       Im3IndexedStorage;

          FHashHandleList:        Tm3HashHandleList;

          f_ItemBuffers : Pl3MemoryChain;
      f_Progress : Il3Progress;    
    private
    // event fields
      f_OnSortFinished : TNotifyEvent;


                procedure         LoadIndex           (
                                                      );

                procedure         SaveIndex           (
                                                      );


                function          pm_GetHashCount     (
                                                      ): Word;


                function          pm_HashSize         (
                                                      ): LongInt;


                function          pm_HashVersion      (
                                                      ): Word;


         protected
           // Il3ProgressSource
      function  pm_GetProgress: Il3Progress;
      procedure pm_SetProgress(const aValue: Il3Progress);
        {-}


                property          HashCount: Word read pm_GetHashCount;

                property          HashSize: LongInt read pm_HashSize;
                property          HashVersion: Word read pm_HashVersion;


          class function          HashDataName        (
                                                      ): WideString;

          class function          HashInfoName        (
                                                      ): WideString;

          class function          StopListName        (
                                                      ): WideString;


         public


          class function          MakeInterface       (const AIndexStorageManager: Im3IndexStorageManager;
                                                       const AIndexComparer: Im3IndexComparer;
                                                       const AIndexReader: Im3IndexReader;
                                                       const AIndexWriter: Im3IndexWriter;
                                                       const ANormalizater: Im3Normalizater;
                                                       const AItemSize: LongInt;
                                                       anOnSortFinished : TNotifyEvent = nil;
                                                       const aProgress  : Il3Progress = nil
                                                      ): Im3IndexUpdater;
            {* - ������� ����������. }

          class function          MakeSafeInterface   (out   AResult: Im3IndexUpdater;
                                                       const AIndexStorageManager: Im3IndexStorageManager;
                                                       const AIndexComparer: Im3IndexComparer;
                                                       const AIndexReader: Im3IndexReader;
                                                       const AIndexWriter: Im3IndexWriter;
                                                       const ANormalizater: Im3Normalizater;
                                                       const AItemSize: LongInt
                                                      ): HRESULT;
            {* - ������� ����������. ��� �������������� ��������. }

                constructor       Create              (const AIndexStorageManager: Im3IndexStorageManager;
                                                       const AIndexComparer: Im3IndexComparer;
                                                       const AIndexReader: Im3IndexReader;
                                                       const AIndexWriter: Im3IndexWriter;
                                                       const ANormalizater: Im3Normalizater;
                                                       const AItemSize: LongInt
                                                      );
            {* - ������� ����������. }

                procedure Cleanup;
                  override;
                  {-}
                function          GetDatePrefix       (
                                                      ): WideString;

                function          GetNumbPrefix       (
                                                      ): WideString;

                function          GetTextPrefix       (
                                                      ): WideString;


                function          GetNormalizater     (const ANormalizaterType: Tm3NormalizaterType
                                                      ): Im3Normalizater;


                procedure         AddMainValue        (const ANormalizater: Im3Normalizater;
                                                       const AValue: WideString;
                                                       const AItem: Pointer;
                                                       const AItemSize: LongInt
                                                      );
                procedure AddKey(aWord               : Tm3BranchHandlePrim;
                                 const AItem         : Pointer;
                                 const AItemSize     : LongInt);


                procedure         AddStopValue        (const ANormalizater: Im3Normalizater;
                                                       const AValue: WideString
                                                      );


         end;


  Tm3IndexSearcher = class(Tm3BaseClass,Im3IndexSearcher)
   {* ��������� ������. }
    private


          _Status:                LongWord;


                function          InitProc00000001    (const ABitMask: LongWord;
                                                       const AIndexStorageManager: Im3IndexStorageManager
                                                      ): LongWord;

                procedure         DoneProc00000001    (
                                                      );


                function          InitProc00000002    (const ABitMask: LongWord;
                                                       const AIndexComparer: Im3IndexComparer
                                                      ): LongWord;

                procedure         DoneProc00000002    (
                                                      );


                function          InitProc00000004    (const ABitMask: LongWord;
                                                       const AIndexReader: Im3IndexReader
                                                      ): LongWord;

                procedure         DoneProc00000004    (
                                                      );


                function          InitProc00000008    (const ABitMask: LongWord;
                                                       const AIndexWriter: Im3IndexWriter
                                                      ): LongWord;

                procedure         DoneProc00000008    (
                                                      );


                function          InitProc00000010    (const ABitMask: LongWord;
                                                       const ANormalizater: Im3Normalizater
                                                      ): LongWord;

                procedure         DoneProc00000010    (
                                                      );


                function          InitProc00000020    (const ABitMask: LongWord;
                                                       const AItemSize: LongInt
                                                      ): LongWord;

                procedure         DoneProc00000020    (
                                                      );


                function          InitProc00000040    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000040    (
                                                      );


    private
    // internal fields
      FItemSize:              LongInt;

      FIndexStorageManager :   Im3IndexStorageManager;

      FIndexComparer:         Im3IndexComparer;

      FIndexReader:           Im3IndexReader;
      FIndexWriter:           Im3IndexWriter;

      FNormalizater:          Im3Normalizater;

      FFileStreamMapView   : Tm3FileStreamMapView;
      FVersion             : Int64;

      f_HasDataLoaded      : Bool;
      f_HashCount          : Word;
      f_HashSize           : LongInt;
      f_HashVersion        : Word;

      f_HashDataStorage    : Im3IndexedStorage;
    private
    // internal methods
      function  GetFileStreamMapView: Tm3FileStreamMapView;
        {-}
    protected
    // internal methods
      class function HashDataName: WideString;
        {-}
      class function HashInfoName: WideString;
        {-}
      class function StopListName: WideString;
        {-}
    public
    // public methods
          class function          MakeInterface       (const AIndexStorageManager: Im3IndexStorageManager;
                                                       const AIndexComparer: Im3IndexComparer;
                                                       const AIndexReader: Im3IndexReader;
                                                       const AIndexWriter: Im3IndexWriter;
                                                       const ANormalizater: Im3Normalizater;
                                                       const AItemSize: LongInt
                                                      ): Im3IndexSearcher;
            {* - ������� ��������� ������. }

          class function          MakeSafeInterface   (out   AResult: Im3IndexSearcher;
                                                       const AIndexStorageManager: Im3IndexStorageManager;
                                                       const AIndexComparer: Im3IndexComparer;
                                                       const AIndexReader: Im3IndexReader;
                                                       const AIndexWriter: Im3IndexWriter;
                                                       const ANormalizater: Im3Normalizater;
                                                       const AItemSize: LongInt
                                                      ): HRESULT;
            {* - ������� ��������� ������. ��� �������������� ��������. }


                constructor       Create              (const AIndexStorageManager: Im3IndexStorageManager;
                                                       const AIndexComparer: Im3IndexComparer;
                                                       const AIndexReader: Im3IndexReader;
                                                       const AIndexWriter: Im3IndexWriter;
                                                       const ANormalizater: Im3Normalizater;
                                                       const AItemSize: LongInt
                                                      );
            {* - ������� ��������� ������. }

                procedure Cleanup;
                  override;
                  {-}
                function          GetDatePrefix       (
                                                      ): WideString;

                function          GetNumbPrefix       (
                                                      ): WideString;

                function          GetTextPrefix       (
                                                      ): WideString;


                function          GetNormalizater     (const ANormalizaterType: Tm3NormalizaterType
                                                      ): Im3Normalizater;


                function          GetResult           (const ANormalizater: Im3Normalizater;
                                                       const AValue: WideString
                                                      ): Im3IndexSearcherResult;
            function GetWordsByMask(const aMask: WideString): Im3NormalizaterResult;
              {* - ���������� ������ ���� �� �����. }
  end;//Tm3IndexSearcher

        Tm3IndexSearcherResult=   class(Tm3BaseClass,Im3IndexSearcherResult)
         {* ��������� ������. }
         private


          _Status:                LongWord;


                function          InitProc00000001    (const ABitMask: LongWord;
                                                       const AFileStream: Tm3FileStream
                                                      ): LongWord;

                procedure         DoneProc00000001    (
                                                      );


                function          InitProc00000002    (const ABitMask: LongWord;
                                                       const AItemSize: LongInt
                                                      ): LongWord;

                procedure         DoneProc00000002    (
                                                      );


                function          InitProc00000004    (const ABitMask: LongWord
                                                      ): LongWord;

                procedure         DoneProc00000004    (
                                                      );


         private


          FItemSize:              LongInt;

          FFileStreamMapView:     Tm3FileStreamMapView;

          FItemBegPtr:            Pointer;
          FItemEndPtr:            Pointer;


         protected


         public


          class function          MakeInterface       (const AFileStream: Tm3FileStream;
                                                       const AItemSize: LongInt
                                                      ): Im3IndexSearcherResult;

          class function          MakeSafeInterface   (out   AResult: Im3IndexSearcherResult;
                                                       const AFileStream: Tm3FileStream;
                                                       const AItemSize: LongInt
                                                      ): HRESULT;


                constructor       Create              (const AFileStream: Tm3FileStream;
                                                       const AItemSize: LongInt
                                                      );

                procedure Cleanup;
                  override;
                  {-}
                procedure         Reset               (
                                                      );


                function          GetCount            (
                                                      ): LongInt;


                function          Get                 (const AItem: Pointer;
                                                       const AItemSize: LongInt
                                                      ): LongBool;


         end;


        Tm3IndexStorageManager=   class(Tm3BaseClass,Im3IndexStorageManager)
         {* �������� ��������� ��� �������. ������ ������ � ��������� ����� �� �����. }
         private


          _Status:                LongWord;


                function          InitProc00000001    (const ABitMask: LongWord;
                                                       const AName: WideString
                                                      ): LongWord;

                procedure         DoneProc00000001    (
                                                      );


         private


          FName:                  WideString;


         protected


         public


          class function          MakeInterface       (const AName: WideString
                                                      ): Im3IndexStorageManager;
            {* - ������� �������� ���������. }

          class function          MakeSafeInterface   (out   AResult: Im3IndexStorageManager;
                                                       const AName: WideString
                                                      ): HRESULT;
            {* - ������� �������� ���������. ��� �������������� ��������. }

                constructor       Create              (const AName: WideString
                                                      );
            {* - ������� �������� ���������. }

                procedure Cleanup;
                  override;
                  {-}
                function          GetRootStorage      (const AReadOnly: LongBool
                                                      ): Im3IndexedStorage;


         end;


        Tm3Normalizater=          class(Tm3BaseClass,Im3Normalizater)
         {* ���������� ������������. ���������� ���� ����� ��� ��� ���������� �����. }
         private


         protected


         public


          class function          MakeInterface       (
                                                      ): Im3Normalizater;
            {* - ������� ������������. }

          class function          MakeSafeInterface   (out   AResult: Im3Normalizater
                                                      ): HRESULT;
            {* - ������� ������������. ��� �������������� ��������. }


          function GetResult(const AValue : WideString;
                             UsePseudo    : Boolean = true;
                             UseAlternate : Boolean = false): Im3NormalizaterResult;
            {-}                 


         end;


        Tm3NormalizaterResult=    class(Tm3BaseClass,Im3NormalizaterResult)
         {* ���������, ������������ Tm3Normalizater. }
         private


          _Status:                LongWord;


                function          InitProc00000001    (const ABitMask: LongWord;
                                                       const AValue: WideString
                                                      ): LongWord;

                procedure         DoneProc00000001    (
                                                      );


         private


          FValue:                 WideString;


         protected


         public


          class function          MakeInterface       (const AValue: WideString
                                                      ): Im3NormalizaterResult;
            {* - ������� ��������� ������������. }

          class function          MakeSafeInterface   (out   AResult: Im3NormalizaterResult;
                                                       const AValue: WideString
                                                      ): HRESULT;
            {* - ������� ��������� ������������. ��� �������������� ��������. }

                constructor       Create              (const AValue: WideString
                                                      );
            {* - ������� ��������� ������������. }

                procedure Cleanup;
                  override;
                  {-}
      function GetFlags: Tm3NormFlags;
        {* - ����� ���������� ������������. }
                function          GetCount            (
                                                      ): Integer;

                function          GetValue            (
                                                      ): WideString;


                procedure Reset;
                  {-}
         end;//Tm3NormalizaterResult

var
 g_WideStringManager : Tl3WideStringManager = nil;
 g_NormalFormsManager   : Tl3SizedPoolManager = nil;

implementation

uses
  l3Chars,
  l3String,

  m3IndexConst,
  m3StorageTools,
  {$IfDef m3UseSTSorter}
  m3STSort,
  {$Else  m3UseSTSorter}
  m3SorCla,
  {$EndIf m3UseSTSorter}
  m3LiveSearcherResult
  ;


var
 g_BranchHandlesManager : Tl3SimpleMemoryManager = nil;

 const
        CHeaderSize000=           Cm3BasClaDefHeaderSize;

        CDatePrefixValue=         WideString('*?date?*');
        CNumbPrefixValue=         WideString('*?numb?*');
        CTextPrefixValue=         WideString('*?text?*');

 type
        THeaderIDSType = (CIDHashInfoStream);

        THeaderIDArray = packed array[THeaderIDSType] of TCLSID;

        PHeaderData000 = ^THeaderData000;
        THeaderData000 = packed record
         {* ��������� hash-info. }
          RZerroFrontierByte: Byte;
            {* - ��������� ����. }
          RVersion: Int64;
            {* - ������ hash-info. }
          RHashCount: Word;
            {* - ���������� ��������� ����. }
          RHashSize:  LongInt;
            {* - ������������ ������ ����� ������ ��� �����������. }
          RHashVersion: Word;
            {* - ������ ��������� �����������. }
        end;//THeaderData000

        PHeaderFull000 = ^THeaderFull000;
        THeaderFull000 = packed record
         {* ������ ��������� hash-info, ��� �������� ������. }
          RHeaderData: THeaderData000;
            {* - ��������� hash-info. }
          _HeaderData: packed array[1..CHeaderSize000-SizeOf(THeaderData000)] of AnsiChar;
            {* - ������ ��� ����������� �������������. }
        end;//THeaderFull000

 const
        CHeaderIDArray:           THeaderIDArray = ('{F7E473D9-ED70-478E-91C4-D80BAAAB385B}'
                                                   );


        CHeaderData000:           THeaderData000 = (RZerroFrontierByte: 0;
                                                    RVersion: Low(Int64);
                                                    RHashCount: Cm2HASDefCount;
                                                    RHashSize: Cm2HASDefSize;
                                                    RHashVersion: Cm2HASVersion;
                                                   );


 type
        PBHLKey=                  ^TBHLKey;
        TBHLKey=                  packed record
                                   RValue  : PWideChar;
                                   rLength : Long
                                  end;


        TValueNormalArray=        packed array of WideString;


        TSorterComparer=          class(Tm3BaseClass,Im3SorterComparer)
         private


          _Status:                LongWord;


                function          InitProc00000001    (const ABitMask: LongWord;
                                                       const AIndexComparer: Im3IndexComparer
                                                      ): LongWord;

                procedure         DoneProc00000001    (
                                                      );


                function          InitProc00000002    (const ABitMask: LongWord;
                                                       const AItemSize: LongInt
                                                      ): LongWord;

                procedure         DoneProc00000002    (
                                                      );


         private


          FItemSize:              LongInt;

          FIndexComparer:         Im3IndexComparer;


         protected


         public


          class function          MakeInterface       (const AIndexComparer: Im3IndexComparer;
                                                       const AItemSize: LongInt
                                                      ): Im3SorterComparer;

          class function          MakeSafeInterface   (out   AResult: Im3SorterComparer;
                                                       const AIndexComparer: Im3IndexComparer;
                                                       const AItemSize: LongInt
                                                      ): HRESULT;


                constructor       Create              (const AIndexComparer: Im3IndexComparer;
                                                       const AItemSize: LongInt
                                                      );

                procedure Cleanup;
                  override;
                  {-}
                function          Compare             (const AVal1: Pointer;
                                                       const AVal2: Pointer;
                                                       const ASize: LongInt
                                                      ): Integer;


         end;


        TNormalizater = class(Tm3BaseClass)
         private


          _Status:                LongWord;


                function          InitProc00000001    (const ABitMask: LongWord;
                                                       const AFileStreamMapView: Tm3FileStreamMapView
                                                      ): LongWord;

                procedure         DoneProc00000001    (
                                                      );


         private


          FFileStreamMapView:     Tm3FileStreamMapView;


         protected


         public

                constructor       Create              (const AFileStreamMapView: Tm3FileStreamMapView
                                                      );

                procedure Cleanup;
                  override;
                  {-}
           function GetWordsByMask(const AValue: WideString): Im3NormalizaterResult;
             {-}
        end;//TNormalizater


        TNormalizaterResult = class(Tm3BaseClass,Im3NormalizaterResult)
         private


          _Status:                LongWord;


                function          InitProc00000001    (const ABitMask: LongWord;
                                                       const AValueNormalArray: TValueNormalArray
                                                      ): LongWord;

                procedure         DoneProc00000001    (
                                                      );


         private


          FValueNormalArray:      TValueNormalArray;
          FValueNormalArrayIndex: Integer;


         protected


         public


          class function          MakeInterface       (const AValueNormalArray: TValueNormalArray
                                                      ): Im3NormalizaterResult;

                constructor       Create              (const AValueNormalArray: TValueNormalArray
                                                      );

                procedure Cleanup;
                  override;
                  {-}
      function GetFlags: Tm3NormFlags;
        {* - ����� ���������� ������������. }
                function          GetCount            (
                                                      ): Integer;

                function          GetValue            (
                                                      ): WideString;


                procedure Reset;
                  {-}
        end;//TNormalizaterResult


// TSorterComparer.private

 function    TSorterComparer.InitProc00000001(const ABitMask: LongWord;
                                              const AIndexComparer: Im3IndexComparer
                                             ): LongWord;
 begin

  with Self do
   begin

    FIndexComparer:=AIndexComparer;

   end;

  Result:=ABitMask;

 end;

 procedure   TSorterComparer.DoneProc00000001(
                                             );
 begin

  with Self do
   begin

    FIndexComparer:=nil;

   end;

 end;

 function    TSorterComparer.InitProc00000002(const ABitMask: LongWord;
                                              const AItemSize: LongInt
                                             ): LongWord;
 begin

  with Self do
   begin

    FItemSize:=AItemSize;

   end;

  Result:=ABitMask;

 end;

 procedure   TSorterComparer.DoneProc00000002(
                                             );
 begin

  with Self do
   begin
   end;

 end;

// TSorterComparer.protected

// TSorterComparer.public

 class
 function    TSorterComparer.MakeInterface(const AIndexComparer: Im3IndexComparer;
                                           const AItemSize: LongInt
                                          ): Im3SorterComparer;
 begin

  with Create(AIndexComparer,AItemSize) do
   try

    Result:=TSorterComparer(Instance);

   finally

    Free;

   end;

 end;

 class
 function    TSorterComparer.MakeSafeInterface(out   AResult: Im3SorterComparer;
                                               const AIndexComparer: Im3IndexComparer;
                                               const AItemSize: LongInt
                                              ): HRESULT;
 begin

  Result:=S_OK;
   try

    AResult:=MakeInterface(AIndexComparer,AItemSize);

   except

    on E: EOutOfMemory do Result:=STG_E_INSUFFICIENTMEMORY;
    on E: EOleSysError do Result:=E.ErrorCode;

   else

    Result:=E_UNEXPECTED;

   end;

 end;

 constructor TSorterComparer.Create(const AIndexComparer: Im3IndexComparer;
                                    const AItemSize: LongInt
                                   );
 begin

  inherited Create();

  m2InitOperation(_Status,InitProc00000001($00000001,AIndexComparer));
  m2InitOperation(_Status,InitProc00000002($00000002,AItemSize));

 end;

procedure TSorterComparer.Cleanup;
begin
 m2DoneOperation(_Status,$00000002,DoneProc00000002);
 m2DoneOperation(_Status,$00000001,DoneProc00000001);
 inherited;
end;

function TSorterComparer.Compare(const AVal1: Pointer;
                                 const AVal2: Pointer;
                                 const ASize: LongInt): Integer;
begin
 Result := m2S32Compare(LongInt(Pm3IdxClaUpdateItem(aVal1)^.BranchHandle.Data.Hash),
                        LongInt(Pm3IdxClaUpdateItem(aVal2)^.BranchHandle.Data.Hash));
 if (Result = 0) then begin
  Result:=m2S32Compare(LongInt(Pm3IdxClaUpdateItem(aVal1)^.BranchHandle),
                       LongInt(Pm3IdxClaUpdateItem(aVal2)^.BranchHandle));
  if (Result = 0) then
   Result:=FIndexComparer.Compare(@Pm3IdxClaUpdateItem(aVal1)^.BranchItem,
                                  @Pm3IdxClaUpdateItem(aVal2)^.BranchItem,
                                  FItemSize);
 end;//Result = 0                                 
end;

// TSorterComparer.end


// TNormalizater.private

 function    TNormalizater.InitProc00000001(const ABitMask: LongWord;
                                            const AFileStreamMapView: Tm3FileStreamMapView
                                           ): LongWord;
 begin

  with Self do
   begin

    FFileStreamMapView:=AFileStreamMapView.Use();

   end;

  Result:=ABitMask;

 end;

 procedure   TNormalizater.DoneProc00000001(
                                           );
 begin

  with Self do
   begin
   
    FreeAndNil(FFileStreamMapView);

   end;

 end;

// TNormalizater.protected

// TNormalizater.public

 constructor TNormalizater.Create(const AFileStreamMapView: Tm3FileStreamMapView
                                 );
 begin

  inherited Create;

  m2InitOperation(_Status,InitProc00000001($00000001,AFileStreamMapView));

 end;

procedure TNormalizater.Cleanup;
begin
 m2DoneOperation(_Status,$00000001,DoneProc00000001);
 inherited;
end;

function TNormalizater.GetWordsByMask(const AValue: WideString): Im3NormalizaterResult;
  {-}

 function __GetValueNormalArray: TValueNormalArray;
 var
  LBegPtr : PWideChar;
  LEndPtr : PWideChar;
  LString : WideString;
 begin//__GetValueNormalArray
  SetLength(Result,0);
  if (FFileStreamMapView <> nil) then begin
   with FFileStreamMapView do begin
    LBegPtr:=PWideChar(MemBase);
    LEndPtr:=PWideChar(LongInt(LBegPtr)+MemSize);
    while (LBegPtr <> LEndPtr) do begin
     LString:=WideString(LBegPtr);
     if l3MaskCompare(LString, aValue) then begin
      SetLength(Result,Succ(Length(Result)));
      Result[Pred(Length(Result))]:=LString;
     end;
     Inc(LongInt(LBegPtr),Succ(Length(LString))*SizeOf(WideChar));
    end;//LBegPtr <> LEndPtr
   end;//with AFileStreamMapView
  end;//AFileStreamMapView <> nil
 end;//__GetValueNormalArray

begin//GetWordsByMask
 Result:=TNormalizaterResult.MakeInterface(__GetValueNormalArray);
end;//GetWordsByMask

// TNormalizaterResult.private

 function    TNormalizaterResult.InitProc00000001(const ABitMask: LongWord;
                                                  const AValueNormalArray: TValueNormalArray
                                                 ): LongWord;
 begin

  with Self do
   begin

    FValueNormalArray:=AValueNormalArray;

   end;

  Result:=ABitMask;

 end;

 procedure   TNormalizaterResult.DoneProc00000001(
                                                 );
 begin

  with Self do
   begin

    SetLength(FValueNormalArray,0);

   end;

 end;

// TNormalizaterResult.protected

// TNormalizaterResult.public

class function TNormalizaterResult.MakeInterface(const AValueNormalArray: TValueNormalArray): Im3NormalizaterResult;
begin
 with Create(AValueNormalArray) do
  try
   Result:=TNormalizaterResult(Instance);
  finally
   Free;
  end;
end;

constructor TNormalizaterResult.Create(const AValueNormalArray: TValueNormalArray);
begin
 inherited Create;
 m2InitOperation(_Status,InitProc00000001($00000001,AValueNormalArray));
end;

procedure TNormalizaterResult.Cleanup;
begin
 m2DoneOperation(_Status,$00000001,DoneProc00000001);
 inherited;
end;

function TNormalizaterResult.GetFlags: Tm3NormFlags;
  {* - ����� ���������� ������������. }
begin
 Result := [];
end;

function TNormalizaterResult.GetCount: Integer;
begin
 Result:=Length(FValueNormalArray);
end;

function TNormalizaterResult.GetValue: WideString;
begin
 if (FValueNormalArrayIndex < Length(FValueNormalArray)) then begin
  Result:=FValueNormalArray[FValueNormalArrayIndex];
  Inc(FValueNormalArrayIndex);
 end else
  Result:='';
end;

procedure TNormalizaterResult.Reset;
  {-}
begin
 FValueNormalArrayIndex := 0;
end;
  
// TNormalizaterResult.end

// start class Tm3BranchHandlePrim

class function Tm3BranchHandlePrim.IsCacheable : Boolean;
  //override;
  {-}
begin
 Result := false;
 // - �.�. �������� ������� ����������
end;

class function Tm3BranchHandlePrim.AllocInstanceMem: TObject;
  //override;
  {-}
begin
 Assert(g_BranchHandlesManager <> nil);
 g_BranchHandlesManager.GetMem(Result, InstanceSize);
 Result := InitInstance(Result);
end;

procedure Tm3BranchHandlePrim.FreeInstanceMem;
  //override;
  {-}
var
 l_Fake : Pointer;
begin
 CleanupInstance;
 l_Fake := Self;
 Assert(g_BranchHandlesManager <> nil);
 g_BranchHandlesManager.FreeMem(l_Fake);
end;

procedure Tm3BranchHandlePrim.AssignHandle(const anItem: Tm3BaseListHandle);
begin
 Data := Tm3BranchHandlePrim(anItem).Data;
end;

// start class Tm3BranchHandle

procedure Tm3BranchHandle.AssignHandle(const anItem: Tm3BaseListHandle);
  //override;
  {-}
begin
 inherited;
 if (anItem Is Tm3BranchHandle) then
  NormalForms := Tm3BranchHandle(anItem).NormalForms;
end;
  
// start class Tm3BranchHandleList.protected

procedure Tm3BranchHandleList.AllocItem(var   AItem: Pointer);
  {-}
begin
 aItem := Tm3BranchHandle.Create;
end;

function Tm3BranchHandleList.CompareKeyByItem(const AKey  : Pointer;
                                              const AItem : Pointer): Integer;
var
 LItem   : Tm3BranchHandle absolute AItem;
 LBHLKey : PBHLKey absolute AKey;
begin
 with LBHLKey^ do
  with LItem.Data do
   Result:=m2MEMCompare(Pointer(rValue),
                        rLength * SizeOf(WideChar),
                        Pointer(Value),
                        g_WideStringManager.ItemLength(Value) * SizeOf(WideChar));
end;

// Tm3BranchHandleList.public

function Tm3BranchHandleList.BinSearchByKey(aValue       : PWideChar;
                                            aLength      : Long;
                                            var   AIndex : LongInt): LongBool;
  //overload;
  {-}
var
 LBHLKey : TBHLKey;
begin
 with LBHLKey do begin
  rValue := aValue;
  rLength := aLength;
 end;//with LBHLKey
 Result:=FindItemByKey(@LBHLKey,AIndex);
end;

function Tm3BranchHandleList.BinSearchByKey(const AValue : WideString;
                                            var   AIndex : LongInt): LongBool;
begin
 Result := BinSearchByKey(PWideChar(aValue), Length(aValue), aIndex);
end;

// Tm3BranchHandleList.end


// start class Tm3HashHandle

constructor Tm3HashHandle.Create;
begin
 inherited;
 Data.BranchHandleList := Tm3BranchHandleList.Create;
end;

procedure Tm3HashHandle.Cleanup;
begin
 l3Free(Data.BranchHandleList);
 inherited;
end;

procedure Tm3HashHandle.AssignHandle(const AItem: Tm3BaseListHandle);
begin
 OleError(E_NOTIMPL);
end;

// Tm3HashHandle.public


// Tm3HashHandleList.private

 function    Tm3HashHandleList.InitProc00000001(const ABitMask: LongWord;
                                                const AHashCount: Word
                                               ): LongWord;
 begin

  with Self do
   begin

    FHashCount:=AHashCount;

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3HashHandleList.DoneProc00000001(
                                               );
 begin

  with Self do
   begin
   end;

 end;

 function    Tm3HashHandleList.InitProc00000002(const ABitMask: LongWord;
                                                const AHashSize: LongInt
                                               ): LongWord;
 begin

  with Self do
   begin

    FHashSize:=AHashSize;

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3HashHandleList.DoneProc00000002(
                                               );
 begin

  with Self do
   begin
   end;

 end;

 function    Tm3HashHandleList.InitProc00000004(const ABitMask: LongWord;
                                                const AHashVersion: Word
                                               ): LongWord;
 begin

  with Self do
   begin

    FHashVersion:=AHashVersion;

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3HashHandleList.DoneProc00000004(
                                               );
 begin

  with Self do
   begin
   end;

 end;

 function    Tm3HashHandleList.InitProc00000008(const ABitMask: LongWord
                                               ): LongWord;
 begin

  with Self do
   begin

    Count:=LongInt(FHashCount);

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3HashHandleList.DoneProc00000008(
                                               );
 begin

  with Self do
   begin
   end;

 end;

// Tm3HashHandleList.protected

 class
 function    Tm3HashHandleList.MakeHash(const AValue: WideString;
                                        const AHashCount: Word;
                                        const AHashSize: LongInt;
                                        const AHashVersion: Word
                                       ): Word;
 begin
  Result:=LongInt(m2HASUpdate16(0,PAnsiChar(AValue),m2S32Min(Length(AValue)*SizeOf(WideChar),AHashSize),AHashVersion) and Pred(AHashCount));
 end;

 procedure   Tm3HashHandleList.AllocItem(var   AItem: Pointer
                                        );
 var
        LItem:                    Tm3HashHandle absolute AItem;
 begin

  LItem:=Tm3HashHandle.Create();

 end;

// Tm3HashHandleList.public

constructor Tm3HashHandleList.Create(anExHandleClass : Rm3BranchHandle;
                                     const AHashCount: Word;
                                     const AHashSize: LongInt;
                                     const AHashVersion: Word
                                    );
begin
 inherited Create;
 if (g_BranchHandlesManager = nil) then
  g_BranchHandlesManager := Tl3SimpleMemoryManager.Create({64} 1024 * 1024 * Tm3BranchHandle.InstanceSize)
 else
  g_BranchHandlesManager.Use;
 if (g_WideStringManager = nil) then
  g_WideStringManager := Tl3WideStringManager.Create({64} 1024 * 1024 * 8)
 else
  g_WideStringManager.Use;
 if (g_NormalFormsManager = nil) then
  g_NormalFormsManager := Tl3SizedPoolManager.Create({64} 1024 * 1024, 4)
 else
  g_NormalFormsManager.Use;
 if (anExHandleClass = nil) then
  f_ExHandleClass := Tm3BranchHandle
 else
  f_ExHandleClass := anExHandleClass;
 m2InitOperation(_Status,InitProc00000001($00000001,AHashCount));
 m2InitOperation(_Status,InitProc00000002($00000002,AHashSize));
 m2InitOperation(_Status,InitProc00000004($00000004,AHashVersion));
 m2InitOperation(_Status,InitProc00000008($00000008));
end;

procedure Tm3HashHandleList.Cleanup;
begin
 m2DoneOperation(_Status,$00000008,DoneProc00000008);
 m2DoneOperation(_Status,$00000004,DoneProc00000004);
 m2DoneOperation(_Status,$00000002,DoneProc00000002);
 m2DoneOperation(_Status,$00000001,DoneProc00000001);
 inherited;
 g_BranchHandlesManager := g_BranchHandlesManager.Free;
 g_WideStringManager := g_WideStringManager.Free;
 g_NormalFormsManager := g_NormalFormsManager.Free;
end;

function Tm3HashHandleList.SearchBranchHandle(const AValue        : WideString;
                                              const ANormalizater : Im3Normalizater;
                                              theFlags            : Pm3SearchWordFlags = nil): Tm3BranchHandlePrim;
var
 LHash         : Word;
 LIndex        : LongInt;
 LBranchHandle : Tm3BranchHandlePrim;
 l_Result      : Im3NormalizaterResult;
 l_Count       : Long;
 l_Flags       : Tm3SearchWordFlags;
begin
 LHash:=MakeHash(AValue,FHashCount,FHashSize,FHashVersion);
 with Tm3HashHandle(Items[LongInt(LHash)]).Data.BranchHandleList do begin
  if BinSearchByKey(AValue,LIndex) then begin
   Result:=Tm3BranchHandle(Items[LIndex]);
   if (theFlags <> nil) then
    theFlags^ := [];
  end else begin
   if (theFlags <> nil) then
    theFlags^ := [m3_swfNew];
   if (aNormalizater = nil) then
    LBranchHandle := Tm3BranchHandlePrim.Create
   else begin
    l_Result := ANormalizater.GetResult(AValue);
    if (l_Result = nil) then begin
     LBranchHandle := Tm3BranchHandlePrim.Create;
    end else begin
     if (theFlags <> nil) then begin
      if (m3_nfPseudo in l_Result.GetFlags) then
       Include(theFlags^, m3_swfPseudo);
      if (m3_nfAlternate in l_Result.GetFlags) then
       Include(theFlags^, m3_swfAlternate);
      if (m3_nfError in l_Result.GetFlags) then
       Include(theFlags^, m3_swfError);
     end;//theFlags <> nil
     l_Count := l_Result.GetCount;
     if (l_Count = 0) then begin
      l_Result := nil;
      LBranchHandle := Tm3BranchHandlePrim.Create;
     end else if (l_Count = 1) then begin
      if (WideCompareStr(aValue, l_Result.GetValue) = 0) then begin
       l_Result := nil;
       LBranchHandle := Tm3BranchHandlePrim.Create;
      end else begin
       l_Result.Reset;
       LBranchHandle := f_ExHandleClass.Create;
      end;//WideCompareStr
     end else
      LBranchHandle := f_ExHandleClass.Create;
    end;//l_Result = nil
   end;
   try
    with LBranchHandle.Data do begin
     Hash := LHash;
     Value := g_WideStringManager.AllocString(aValue);
    end;//with LBranchHandle.Data
    Insert(LIndex,Pointer(LBranchHandle));
    if (l_Result <> nil) then begin
     with Tm3BranchHandle(LBranchHandle) do begin
      with l_Result do begin
       g_NormalFormsManager.AllocItem(NormalForms, l_Count);
       if (theFlags = nil) then
        for LIndex := 0 to Pred(l_Count) do
         Pm3BranchHandlePrim(PAnsiChar(NormalForms) +
                             LIndex * SizeOf(Tm3BranchHandlePrim))^ :=
                              SearchBranchHandle(GetValue, aNormalizater)
       else begin
        for LIndex := 0 to Pred(l_Count) do
         Pm3BranchHandlePrim(PAnsiChar(NormalForms) +
                             LIndex * SizeOf(Tm3BranchHandlePrim))^ :=
                              SearchBranchHandle(GetValue, aNormalizater, @l_Flags);
        if (m3_swfError in l_Flags) then
         Include(theFlags^, m3_swfError);
       end;//theFlags = nil
      end;//l_Result
     end;//with LBranchHandle
    end;//l_Result <> nil
   finally
    Result := lBranchHandle.Free;
   end;//try..finally
  end;//BinSearchByKey
 end;//with Tm3HashHandle(Items[LongInt(LHash)]).Data.BranchHandleList
end;

// Tm3HashHandleList.end


// Tm3HashInfoStream.private

// Tm3HashInfoStream.protected

 function    Tm3HashInfoStream.InitHeaderData(
                                             ): Pointer;
 begin

  Result:=@CHeaderData000;

 end;

 function    Tm3HashInfoStream.InitHeaderDataSize(
                                                 ): LongInt;
 begin

  Result:=SizeOf(CHeaderData000);

 end;

 function    Tm3HashInfoStream.InitHeaderFullSize(
                                                 ): LongInt;
 begin

  Result:=SizeOf(THeaderFull000);

 end;

// Tm3HashInfoStream.public

 class
 function    Tm3HashInfoStream.HeaderID(
                                       ): TCLSID;
 begin

  Result:=CHeaderIDArray[CIDHashInfoStream];

 end;

// Tm3HashInfoStream.end


// Tm3IndexUpdater.private

 function    Tm3IndexUpdater.InitProc00000001(const ABitMask: LongWord;
                                              const AIndexStorageManager: Im3IndexStorageManager
                                             ): LongWord;
 begin

  with Self do
   begin

    FIndexStorageManager:=AIndexStorageManager;

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3IndexUpdater.DoneProc00000001(
                                             );
 begin

  with Self do
   begin

    FIndexStorageManager:=nil;

   end;

 end;

 function    Tm3IndexUpdater.InitProc00000002(const ABitMask: LongWord;
                                              const AIndexComparer: Im3IndexComparer
                                             ): LongWord;
 begin

  with Self do
   begin

    FIndexComparer:=AIndexComparer;

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3IndexUpdater.DoneProc00000002(
                                             );
 begin

  with Self do
   begin

    FIndexComparer:=nil;

   end;

 end;

 function    Tm3IndexUpdater.InitProc00000004(const ABitMask: LongWord;
                                              const AIndexReader: Im3IndexReader
                                             ): LongWord;
 begin

  with Self do
   begin

    FIndexReader:=AIndexReader;

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3IndexUpdater.DoneProc00000004(
                                             );
 begin

  with Self do
   begin

    FIndexReader:=nil;

   end;

 end;

 function    Tm3IndexUpdater.InitProc00000008(const ABitMask: LongWord;
                                              const AIndexWriter: Im3IndexWriter
                                             ): LongWord;
 begin

  with Self do
   begin

    FIndexWriter:=AIndexWriter;

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3IndexUpdater.DoneProc00000008(
                                             );
 begin

  with Self do
   begin

    FIndexWriter:=nil;

   end;

 end;

 function    Tm3IndexUpdater.InitProc00000010(const ABitMask: LongWord;
                                              const ANormalizater: Im3Normalizater
                                             ): LongWord;
 begin

  with Self do
   begin

    FNormalizater:=ANormalizater;

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3IndexUpdater.DoneProc00000010(
                                             );
 begin

  with Self do
   begin

    FNormalizater:=nil;

   end;

 end;

 function    Tm3IndexUpdater.InitProc00000020(const ABitMask: LongWord;
                                              const AItemSize: LongInt
                                             ): LongWord;
 begin

  with Self do
   begin

    FItemSize:=AItemSize;

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3IndexUpdater.DoneProc00000020(
                                             );
 begin

  with Self do
   begin
   end;

 end;

 function    Tm3IndexUpdater.InitProc00000040(const ABitMask: LongWord
                                             ): LongWord;
 begin

  with Self do
   begin

    FRootStorage:=FIndexStorageManager.GetRootStorage(False);

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3IndexUpdater.DoneProc00000040(
                                             );
 begin

  with Self do
   begin

    FRootStorage:=nil;

   end;

 end;

 function    Tm3IndexUpdater.InitProc00000100(const ABitMask: LongWord
                                             ): LongWord;
 const
  CStatStgFullMode = STGM_READ or STGM_SHARE_EXCLUSIVE;
 var
  l_Stream : IStream;
 begin
  if l3IOk(m2COMSafeOpenStream(FRootStorage,
                               PWideChar(HashInfoName),
                               CStatStgFullMode,
                               false,
                               l_Stream)) then
   try
    FHashInfoStream:=Tm3HashInfoStream.Create(l_Stream,
                                              m2COMModeAccess(CStatStgFullMode));
   finally
    l_Stream := nil
   end
  else
   FHashInfoStream:=Tm3HashInfoStream.Create(nil,
                                             m2COMModeAccess(CStatStgFullMode));
  Result:=ABitMask;
 end;

 procedure   Tm3IndexUpdater.DoneProc00000100(
                                             );
 begin
  l3Free(FHashInfoStream);
 end;

 function    Tm3IndexUpdater.InitProc00000200(const ABitMask: LongWord
                                             ): LongWord;
 begin
  FStopListStorage := m3COMOpenStorage(FRootStorage,
                                       l3PCharLen(StopListName),
                                       m3_saReadWrite,
                                       true);
  Result:=ABitMask;
 end;

 procedure   Tm3IndexUpdater.DoneProc00000200(
                                             );
 begin

  with Self do
   begin

    FStopListStorage:=nil;

   end;

 end;

 function    Tm3IndexUpdater.InitProc00000400(const ABitMask: LongWord
                                             ): LongWord;
 begin
  {$IfDef m3MultiThreadIndex}
  InitializeCriticalSection(FRTLCriticalSection);
  {$EndIf m3MultiThreadIndex}
  Result:=ABitMask;
 end;

 procedure   Tm3IndexUpdater.DoneProc00000400(
                                             );
 begin
  {$IfDef m3MultiThreadIndex}
  DeleteCriticalSection(FRTLCriticalSection);
  {$EndIf m3MultiThreadIndex}
 end;

function Tm3IndexUpdater.InitProc00000800(const ABitMask: LongWord): LongWord;
begin
 FSorter:=Tm3Sorter.MakeInterface(FItemSize+SizeOf(Tm3IdxClaUpdateItem)-SizeOf(Tm3IdxClaBranchItem)*SizeOf(AnsiChar),
                                  TSorterComparer.MakeInterface(FIndexComparer,FItemSize));
 Result:=ABitMask;
end;

procedure Tm3IndexUpdater.DoneProc00000800;
begin
 FSorter:=nil;
end;

function Tm3IndexUpdater.InitProc00001000(const ABitMask: LongWord): LongWord;
begin
 FHashHandleList:=Tm3HashHandleList.Create(nil, HashCount,HashSize,HashVersion);
 Result:=ABitMask;
end;

procedure Tm3IndexUpdater.DoneProc00001000;
begin
 l3Free(FHashHandleList);
end;

function Tm3IndexUpdater.InitProc00002000(const ABitMask: LongWord): LongWord;
begin
 LoadIndex;
 Result:=ABitMask;
end;

procedure Tm3IndexUpdater.DoneProc00002000;
begin
 try
  SaveIndex;
 except
  on E: Exception do begin
   {$If Declared(Gm0EXCLibDefSrv)}
   Gm0EXCLibDefSrv.ShowSaveMessage(Cm0EXCLibINF, E);
   {$IfEnd}
   raise;
  end;//on E: Exception
 end;//try..except
end;

procedure Tm3IndexUpdater.LoadIndex;

  procedure   __Load(const AStorage: Im3IndexedStorage);

   function __Forward(const AItemPtr : PPointer;
                      const AIndex   : LongInt): Boolean;

    function __OpenStorage(const AStorage : Im3IndexedStorage;
                           anIndex        : Long): Im3IndexedStorage;
    const
     CStatStgReadMode = STGM_READ or
                        STGM_SHARE_EXCLUSIVE or
                        STGM_DIRECT;
    var
     l_Result  : hResult;
    begin//__OpenStorage
     l_Result := m3COMSafeOpenStorage(aStorage,
                                      anIndex,
                                      CStatStgReadMode,
                                      false,
                                      Result);
     if (l_Result = STG_E_FILENOTFOUND) then
      Result := nil
     else
      OleCheck(l_Result);
    end;//__OpenStorage

    function __OpenStream(const AStorage : Im3IndexedStorage;
                          const AName    : PWideChar): IStream;
    const
     CStatStgReadMode = STGM_READ or
                        STGM_SHARE_EXCLUSIVE or
                        STGM_DIRECT;
    begin//__OpenStream
     Result := m2COMOpenStream(AStorage,AName,CStatStgReadMode,False);
    end;//__OpenStream

   var
    LBranchHandle : Tm3BranchHandlePrim;
    LItemData     : Pointer;
    LEnumStatStg  : IEnumStatStg;
    LResult       : LongInt;
    LStatStg      : TStatStg;
    LStorage      : Im3IndexedStorage;
    LStream       : IStream;
   begin//__Forward
    Result:=True;
    with Tm3HashHandle(AItemPtr^).Data do begin
     with BranchHandleList do begin
      LStorage := __OpenStorage(aStorage, aIndex);
      if (LStorage = nil) then
       Exit;
      f_ItemBuffers.AllocItem(lItemData);
      try
       OleCheck(LStorage.EnumElements(0,nil,0,LEnumStatStg));
       repeat
        OleCheck(LEnumStatStg.Next(1,LStatStg,@LResult));
        if (LResult = 0) then
         Break;
        with LStatStg do begin
         try
          LBranchHandle := FHashHandleList.SearchBranchHandle(pwcsName, FNormalizater);
          LStream := __OpenStream(LStorage, pwcsName);
          while FIndexReader.Get(LStream,LItemData,FItemSize) do
           AddKey(LBranchHandle, lItemData, FItemSize);
         finally
          m2MEMCoTaskFree(Pointer(pwcsName));
         end;//try..finally
        end;//with LStatStg
       until False;
      finally
       f_ItemBuffers.FreeItem(LItemData);
      end;//try..finally
     end;//with BranchHandleList
    end;//with Tm3HashHandle(AItemPtr^).Data
   end;//__Forward
  begin//__Load
   FHashHandleList.IterateAllF(l3L2IA(@__Forward));
  end;//__Load

var
 l_Storage : Im3IndexedStorage;
begin//LoadIndex
 Exit; // !!! &&& !!!
 if l3IOk(m3COMSafeOpenStorage(FRootStorage,
                               l3PCharLen(HashDataName),
                               STGM_READ or STGM_SHARE_EXCLUSIVE,
                               false,
                               l_Storage)) then
 try
  __Load(l_Storage);
 finally
  l_Storage := nil;
 end;//try..finally
end;//LoadIndex

procedure Tm3IndexUpdater.SaveIndex;

  procedure __Save(const AHashDataStorage : Im3IndexedStorage;
                   const AStopListStorage : Im3IndexedStorage;
                   const AStream          : IStream);

   function __OpenStorage(const AStorage : Im3IndexedStorage;
                          anIndex        : Long): Im3IndexedStorage;
   begin
    Result := m3COMOpenStorage(aStorage, anIndex, m3_saReadWrite, true);
   end;

   function __CreateStream(const AStorage : Im3IndexedStorage;
                           const AName    : Tl3PCharLen): IStream;
   begin
    Result := m3COMOpenStream(aStorage, aName, m3_saReadWrite, true);
   end;

   function __IsStopValue(const AStorage : Im3IndexedStorage;
                          const AValue   : WideString): LongBool;

    function  __OpenStream(const AStorage : Im3IndexedStorage;
                           const AValue   : WideString): IStream;
    const
        CStatStgReadMode = STGM_READ or
                           STGM_SHARE_EXCLUSIVE or
                           STGM_DIRECT;
    var
     l_Result : hResult;
    begin//__OpenStream
     l_Result := m2COMSafeOpenStream(AStorage,PWideChar(AValue),CStatStgReadMode,False, Result);
     if l3IFail(l_Result) then begin
      if (l_Result = STG_E_FILENOTFOUND) then
       Result:=nil
      else
       OleError(l_Result);
     end;//l3IFail(l_Result)
    end;//__OpenStream

   begin//__IsStopValue
    Result:=(__OpenStream(AStorage,AValue) <> nil);
   end;//__IsStopValue

  var
   LBranchHandle : Tm3BranchHandlePrim;
   LHash         : Word;
   LItemData     : Pointer;
   LItemSize     : LongInt;
   LStorage      : Im3IndexedStorage;
   LStream       : IStream;
   l_Count       : Int64;
   l_Current     : Int64;
  begin//__Save
   {$IfDef m3UseSTSorter}
   {$Else  m3UseSTSorter}
   FSorter.Sort;
   {$EndIf m3UseSTSorter}
   if Assigned(f_OnSortFinished) then
    f_OnSortFinished(Self);
   LBranchHandle:=nil;
   LHash:=Word(-1);
   LItemSize:=FSorter.GetItemSize;
   f_ItemBuffers.AllocItem(LItemData,LItemSize);
   try
    l_Count := FSorter.GetCount;
    if (f_Progress <> nil) then
     f_Progress.Start(l_Count, l3CStr('������ �������'));
    try
     while FSorter.Get(LItemData, LItemSize, @l_Current) do begin
      l_Current := l_Count - l_Current;
      if (l_Current mod 1000 = 0) AND (f_Progress <> nil) then
       f_Progress.Progress(l_Current);
      with Pm3IdxClaUpdateItem(LItemData)^ do begin
 //      if not(__IsStopValue(AStopListStorage,BranchHandle.Data.Value)) then begin
        if (m2S32Compare(LongInt(BranchHandle),LongInt(LBranchHandle)) <> 0) then begin
         LBranchHandle := BranchHandle;
         with LBranchHandle.Data do begin
//          NormalForms := nil; // - ��� ���������� ����� ��� �� �����
          if (m2S32Compare(LongInt(Hash),LongInt(LHash)) <> 0) then begin
             LHash:=Hash;
             LStorage:=__OpenStorage(AHashDataStorage,LHash);
          end;//m2S32Compare(..
          with g_WideStringManager do begin
           try
            LStream:=__CreateStream(LStorage, StringAsPCharLen(Value));
           except
            on E: EOleError do begin
             {$If Declared(Gm0EXCLibDefSrv)}
             Gm0EXCLibDefSrv.SaveException(E);
             Gm0EXCLibDefSrv.SaveMessage(Cm0EXCLibINF,
                                         '��� ������ ' +
                                         l3PCharLen2String(StringAsPCharLen(Value), CP_ANSI));
             {$IfEnd}                            
             LStream := nil;
            end;//EOleError
           end;//try..except
           if (LStream <> nil) then begin
            m2COMWriteBuffer(AStream,Value^,ItemLength(Value)*SizeOf(WideChar));
            m2COMWriteBuffer(AStream,cc_NullVar,SizeOf(WideChar));
           end;//LStream <> nil
          end;//with g_WideStringManager
         end;//with LBranchHandle.Data
        end;//m2S32Compare(..
        if (LStream <> nil) then
         FIndexWriter.Put(LStream,@BranchItem,FItemSize);
 //      end;//not(__IsStopValue(..
      end;//with Pm3IdxClaUpdateItem(LItemData)^
     end;//while FSorter.Get(..
    finally
     if (f_Progress <> nil) then
      f_Progress.Finish;
    end;//try..finally
   finally
    f_ItemBuffers.FreeItem(LItemData);
   end;//try..finally
  end;//__Save

var
 l_Storage : Im3IndexedStorage;
 l_Version : Int64;
begin//SaveIndex
 l_Version := PHeaderData000(FHashInfoStream._HeaderData)^.RVersion;
 l3Free(FHashInfoStream);
 FRootStorage.DestroyElement(PWideChar(HashInfoName));
 FHashInfoStream := Tm3HashInfoStream.Create(
                     m3COMOpenStream(FRootStorage,
                                     l3PCharLen(HashInfoName),
                                     m3_saReadWrite,
                                     true),
                     m2COMModeAccess(m3_saReadWrite));
 with PHeaderData000(FHashInfoStream._HeaderData)^ do begin
  RVersion := l_Version;
  if (RVersion = High(Int64)) then 
   RVersion:=Low(Int64)
  else
   Inc(RVersion)
 end;//with PHeaderData000(FHashInfoStream...
 l_Storage := m3COMOpenStorage(FRootStorage,
                               l3PCharLen(HashDataName),
                               m3_saReadWrite,
                               true);
 try
  l_Storage.SetIndexParam(16, 16);
  __Save(m2COMDestroyData(l_Storage) As Im3IndexedStorage,FStopListStorage,FHashInfoStream);
 finally
  l_Storage := nil;
 end;//try..finally
end;//SaveIndex

function Tm3IndexUpdater.pm_GetHashCount: Word;
begin
 Result:=PHeaderData000(FHashInfoStream._HeaderData)^.RHashCount;
end;

function Tm3IndexUpdater.pm_HashSize: LongInt;
begin
 Result:=PHeaderData000(FHashInfoStream._HeaderData)^.RHashSize;
end;

function Tm3IndexUpdater.pm_HashVersion: Word;
begin
 Result:=PHeaderData000(FHashInfoStream._HeaderData)^.RHashVersion;
end;

// Tm3IndexUpdater.protected

function Tm3IndexUpdater.pm_GetProgress: Il3Progress;
  {-}
begin
 Result := f_Progress;
end;

procedure Tm3IndexUpdater.pm_SetProgress(const aValue: Il3Progress);
  {-}
begin
 f_Progress := aValue;
end;

class function Tm3IndexUpdater.HashDataName: WideString;
begin
 Result := m3HashDataName;
end;

class function Tm3IndexUpdater.HashInfoName: WideString;
begin
 Result := m3HashInfoName;
end;

class function Tm3IndexUpdater.StopListName: WideString;
begin
 Result:=WideString('stop-list');
end;

// Tm3IndexUpdater.public

class
function    Tm3IndexUpdater.MakeInterface(const AIndexStorageManager: Im3IndexStorageManager;
                                          const AIndexComparer: Im3IndexComparer;
                                          const AIndexReader: Im3IndexReader;
                                          const AIndexWriter: Im3IndexWriter;
                                          const ANormalizater: Im3Normalizater;
                                          const AItemSize: LongInt;
                                          anOnSortFinished : TNotifyEvent = nil;
                                          const aProgress  : Il3Progress = nil
                                         ): Im3IndexUpdater;
begin
 with Create(AIndexStorageManager,AIndexComparer,AIndexReader,AIndexWriter,ANormalizater,AItemSize) do
  try
   f_OnSortFinished := anOnSortFinished;
   f_Progress := aProgress;
   Result:=Tm3IndexUpdater(Instance);
  finally
   Free;
  end;
end;

class
function Tm3IndexUpdater.MakeSafeInterface(out   AResult: Im3IndexUpdater;
                                           const AIndexStorageManager: Im3IndexStorageManager;
                                           const AIndexComparer: Im3IndexComparer;
                                           const AIndexReader: Im3IndexReader;
                                           const AIndexWriter: Im3IndexWriter;
                                           const ANormalizater: Im3Normalizater;
                                           const AItemSize: LongInt
                                           ): HRESULT;
begin
 Result:=S_OK;
 try
  AResult:=MakeInterface(AIndexStorageManager,AIndexComparer,AIndexReader,AIndexWriter,ANormalizater,AItemSize);
 except
  on E: EOutOfMemory do Result:=STG_E_INSUFFICIENTMEMORY;
  on E: EOleSysError do Result:=E.ErrorCode;
  else
   Result:=E_UNEXPECTED;
 end;//try..except
end;

constructor Tm3IndexUpdater.Create(const AIndexStorageManager: Im3IndexStorageManager;
                                   const AIndexComparer: Im3IndexComparer;
                                   const AIndexReader: Im3IndexReader;
                                   const AIndexWriter: Im3IndexWriter;
                                   const ANormalizater: Im3Normalizater;
                                   const AItemSize: LongInt
                                  );
begin
 inherited Create;
 m2InitOperation(_Status,InitProc00000001($00000001,AIndexStorageManager));
 m2InitOperation(_Status,InitProc00000002($00000002,AIndexComparer));
 m2InitOperation(_Status,InitProc00000004($00000004,AIndexReader));
 m2InitOperation(_Status,InitProc00000008($00000008,AIndexWriter));
 m2InitOperation(_Status,InitProc00000010($00000010,ANormalizater));
 m2InitOperation(_Status,InitProc00000020($00000020,AItemSize));
 m2InitOperation(_Status,InitProc00000040($00000040));
 m2InitOperation(_Status,InitProc00000100($00000100));
 m2InitOperation(_Status,InitProc00000200($00000200));
 m2InitOperation(_Status,InitProc00000400($00000400));
 m2InitOperation(_Status,InitProc00000800($00000800));
 m2InitOperation(_Status,InitProc00001000($00001000));
 f_ItemBuffers := l3NewMemoryChain(FSorter.GetItemSize);
 m2InitOperation(_Status,InitProc00002000($00002000));
end;

procedure Tm3IndexUpdater.Cleanup;
begin
 m2DoneOperation(_Status,$00002000,DoneProc00002000);
 m2DoneOperation(_Status,$00001000,DoneProc00001000);
 m2DoneOperation(_Status,$00000800,DoneProc00000800);
 m2DoneOperation(_Status,$00000400,DoneProc00000400);
 m2DoneOperation(_Status,$00000200,DoneProc00000200);
 m2DoneOperation(_Status,$00000100,DoneProc00000100);
 m2DoneOperation(_Status,$00000040,DoneProc00000040);
 m2DoneOperation(_Status,$00000020,DoneProc00000020);
 m2DoneOperation(_Status,$00000010,DoneProc00000010);
 m2DoneOperation(_Status,$00000008,DoneProc00000008);
 m2DoneOperation(_Status,$00000004,DoneProc00000004);
 m2DoneOperation(_Status,$00000002,DoneProc00000002);
 m2DoneOperation(_Status,$00000001,DoneProc00000001);
 f_Progress := nil;
 inherited;
end;

function Tm3IndexUpdater.GetDatePrefix: WideString;
begin
 Result := CDatePrefixValue;
end;

function Tm3IndexUpdater.GetNumbPrefix: WideString;
begin
 Result := CNumbPrefixValue;
end;

function Tm3IndexUpdater.GetTextPrefix: WideString;
begin
 Result := CTextPrefixValue;
end;

function Tm3IndexUpdater.GetNormalizater(const ANormalizaterType: Tm3NormalizaterType
                                         ): Im3Normalizater;
begin
 case ANormalizaterType of
  Cm3NormalizaterInternal:
   Result:=FNormalizater;
  else
   OleError(STG_E_INVALIDFUNCTION);
 end;//case ANormalizaterType
end;

procedure Tm3IndexUpdater.AddKey(aWord               : Tm3BranchHandlePrim;
                                 const AItem         : Pointer;
                                 const AItemSize     : LongInt);
var                                 
 LItemData : Pm3IdxClaUpdateItem;
 LItemSize : LongInt;
 l_Hi      : Long;
 l_Lo      : Long;
 l_Index   : Long;
begin
 LItemSize := FSorter.GetItemSize;
 f_ItemBuffers.AllocItem(Pointer(LItemData),LItemSize);
 try
  m2MEMCopy(@LItemData^.BranchItem, aItem, FItemSize);
  if (aWord Is Tm3BranchHandle) then
   with Tm3BranchHandle(aWord) do begin
    l_Lo := 0;
    l_Hi := Pred(g_NormalFormsManager.ItemLength(NormalForms));
    if (l_Hi < l_Lo) then begin
     LItemData^.BranchHandle := aWord;
     FSorter.Put(LItemData, LItemSize);
    end else
     for l_Index := l_Lo to l_Hi do begin
      LItemData^.BranchHandle := Pm3BranchHandlePrim(PAnsiChar(NormalForms) +
                                                     l_Index * SizeOf(Tm3BranchHandlePrim))^;
      FSorter.Put(LItemData, LItemSize);
     end;//for l_Index
   end//with Tm3BranchHandle(aWord)
  else begin
   LItemData^.BranchHandle := aWord;
   FSorter.Put(LItemData, LItemSize);
  end;//aWord Is Tm3BranchHandle
 finally
  f_ItemBuffers.FreeItem(Pointer(LItemData));
 end;//try..finally
end;

procedure   Tm3IndexUpdater.AddMainValue(const ANormalizater : Im3Normalizater;
                                         const AValue        : WideString;
                                         const AItem         : Pointer;
                                         const AItemSize     : LongInt);
begin
 Assert(FItemSize = AItemSize);
 {$IfDef m3MultiThreadIndex}
 EnterCriticalSection(FRTLCriticalSection);
 try
 {$EndIf m3MultiThreadIndex}
  AddKey(FHashHandleList.SearchBranchHandle(AValue, ANormalizater), aItem, aItemSize);
 {$IfDef m3MultiThreadIndex}
 finally
  LeaveCriticalSection(FRTLCriticalSection);
 end;//try..finally
 {$EndIf m3MultiThreadIndex}
end;

 procedure   Tm3IndexUpdater.AddStopValue(const ANormalizater : Im3Normalizater;
                                          const AValue        : WideString);

  procedure   __AddStopValue(const AValue: WideString
                            );
  begin
   m3COMOpenStream(FStopListStorage, l3PCharLen(AValue), m3_saReadWrite, true);
  end;

 var
  LIndex : LongInt;
 begin
  with ANormalizater.GetResult(AValue) do
   for LIndex := 0 to Pred(GetCount()) do
    __AddStopValue(GetValue());
 end;

// Tm3IndexUpdater.end


// Tm3IndexSearcher.private

 function    Tm3IndexSearcher.InitProc00000001(const ABitMask: LongWord;
                                               const AIndexStorageManager: Im3IndexStorageManager
                                              ): LongWord;
 begin
  FIndexStorageManager:=AIndexStorageManager;
  Result:=ABitMask;
 end;

 procedure   Tm3IndexSearcher.DoneProc00000001(
                                              );
 begin
  FIndexStorageManager:=nil;
 end;

 function    Tm3IndexSearcher.InitProc00000002(const ABitMask: LongWord;
                                               const AIndexComparer: Im3IndexComparer
                                              ): LongWord;
 begin
  FIndexComparer:=AIndexComparer;
  Result:=ABitMask;
 end;

 procedure   Tm3IndexSearcher.DoneProc00000002(
                                              );
 begin
  FIndexComparer:=nil;
 end;

 function    Tm3IndexSearcher.InitProc00000004(const ABitMask: LongWord;
                                               const AIndexReader: Im3IndexReader
                                              ): LongWord;
 begin
  FIndexReader:=AIndexReader;
  Result:=ABitMask;
 end;

 procedure   Tm3IndexSearcher.DoneProc00000004(
                                              );
 begin
  FIndexReader:=nil;
 end;

 function    Tm3IndexSearcher.InitProc00000008(const ABitMask: LongWord;
                                               const AIndexWriter: Im3IndexWriter
                                              ): LongWord;
 begin
  FIndexWriter:=AIndexWriter;
  Result:=ABitMask;
 end;

 procedure   Tm3IndexSearcher.DoneProc00000008(
                                              );
 begin
  FIndexWriter:=nil;
 end;

 function    Tm3IndexSearcher.InitProc00000010(const ABitMask: LongWord;
                                               const ANormalizater: Im3Normalizater
                                              ): LongWord;
 begin
  FNormalizater:=ANormalizater;
  Result:=ABitMask;
 end;

 procedure   Tm3IndexSearcher.DoneProc00000010(
                                              );
 begin
  FNormalizater:=nil;
 end;

 function    Tm3IndexSearcher.InitProc00000020(const ABitMask: LongWord;
                                               const AItemSize: LongInt
                                              ): LongWord;
 begin
  FItemSize:=AItemSize;
  Result:=ABitMask;
 end;

 procedure   Tm3IndexSearcher.DoneProc00000020(
                                              );
 begin
 end;

 function    Tm3IndexSearcher.InitProc00000040(const ABitMask: LongWord
                                              ): LongWord;
 begin
  Result:=ABitMask;
 end;

 procedure   Tm3IndexSearcher.DoneProc00000040(
                                              );
 begin
  FreeAndNil(FFileStreamMapView);
 end;

 function    Tm3IndexSearcher.GetFileStreamMapView(
                                                  ): Tm3FileStreamMapView;

  function    __OpenStream(const AStorage: Im3IndexedStorage;
                           var   AVersion: Int64
                          ): IStream;
  const
        CStatStgReadMode=         STGM_READ or
                                  STGM_SHARE_EXCLUSIVE or
                                  STGM_DIRECT;
  var
        LHashInfoStream:          Tm3HashInfoStream;
  begin

   LHashInfoStream:=Tm3HashInfoStream.Create(m3COMOpenStream(AStorage, l3PCharLen(HashInfoName), CStatStgReadMode, False), m2COMModeAccess(CStatStgReadMode));
    try

     with PHeaderData000(LHashInfoStream._HeaderData)^ do
      begin

       AVersion:=RVersion;

      end;

     Result:=LHashInfoStream;

    finally

     FreeAndNil(LHashInfoStream);

    end;

  end;

 var
        LStream:                  IStream;
        LTempStream:              Tm3TempStream;
        LVersion:                 Int64;
 begin

  LStream:=__OpenStream(FIndexStorageManager.GetRootStorage(True),LVersion);

  if ((FVersion <> LVersion) or (FFileStreamMapView = nil))
   then
    begin

     FreeAndNil(FFileStreamMapView);
     FFileStreamMapView:=nil;

     LTempStream:=Tm3TempStream.Create();
      try

       m2COMCopyData(LTempStream,LStream);

       FFileStreamMapView:=LTempStream.CreateMapView(PAGE_READONLY,FILE_MAP_READ);
       FVersion:=LVersion;

      finally

       FreeAndNil(LTempStream);

      end;

    end;

  Result:=FFileStreamMapView;

 end;

// Tm3IndexSearcher.protected

 class
 function    Tm3IndexSearcher.HashDataName(
                                          ): WideString;
 begin

  Result:=Tm3IndexUpdater.HashDataName();

 end;

 class
 function    Tm3IndexSearcher.HashInfoName(
                                          ): WideString;
 begin

  Result:=Tm3IndexUpdater.HashInfoName();

 end;

 class
 function    Tm3IndexSearcher.StopListName(
                                          ): WideString;
 begin

  Result:=Tm3IndexUpdater.StopListName();

 end;

// Tm3IndexSearcher.public

 class
 function    Tm3IndexSearcher.MakeInterface(const AIndexStorageManager: Im3IndexStorageManager;
                                            const AIndexComparer: Im3IndexComparer;
                                            const AIndexReader: Im3IndexReader;
                                            const AIndexWriter: Im3IndexWriter;
                                            const ANormalizater: Im3Normalizater;
                                            const AItemSize: LongInt
                                           ): Im3IndexSearcher;
 begin

  with Create(AIndexStorageManager,AIndexComparer,AIndexReader,AIndexWriter,ANormalizater,AItemSize) do
   try

    Result:=Tm3IndexSearcher(Instance);

   finally

    Free;

   end;

 end;

 class
 function    Tm3IndexSearcher.MakeSafeInterface(out   AResult: Im3IndexSearcher;
                                                const AIndexStorageManager: Im3IndexStorageManager;
                                                const AIndexComparer: Im3IndexComparer;
                                                const AIndexReader: Im3IndexReader;
                                                const AIndexWriter: Im3IndexWriter;
                                                const ANormalizater: Im3Normalizater;
                                                const AItemSize: LongInt
                                               ): HRESULT;
 begin

  Result:=S_OK;
   try

    AResult:=MakeInterface(AIndexStorageManager,AIndexComparer,AIndexReader,AIndexWriter,ANormalizater,AItemSize);

   except

    on E: EOutOfMemory do Result:=STG_E_INSUFFICIENTMEMORY;
    on E: EOleSysError do Result:=E.ErrorCode;

   else

    Result:=E_UNEXPECTED;

   end;

 end;

 constructor Tm3IndexSearcher.Create(const AIndexStorageManager: Im3IndexStorageManager;
                                     const AIndexComparer: Im3IndexComparer;
                                     const AIndexReader: Im3IndexReader;
                                     const AIndexWriter: Im3IndexWriter;
                                     const ANormalizater: Im3Normalizater;
                                     const AItemSize: LongInt
                                    );
 begin

  inherited Create();

  m2InitOperation(_Status,InitProc00000001($00000001,AIndexStorageManager));
  m2InitOperation(_Status,InitProc00000002($00000002,AIndexComparer));
  m2InitOperation(_Status,InitProc00000004($00000004,AIndexReader));
  m2InitOperation(_Status,InitProc00000008($00000008,AIndexWriter));
  m2InitOperation(_Status,InitProc00000010($00000010,ANormalizater));
  m2InitOperation(_Status,InitProc00000020($00000020,AItemSize));
  m2InitOperation(_Status,InitProc00000040($00000040));

 end;

procedure Tm3IndexSearcher.Cleanup;
begin
 f_HashDataStorage := nil;
 m2DoneOperation(_Status,$00000040,DoneProc00000040);
 m2DoneOperation(_Status,$00000020,DoneProc00000020);
 m2DoneOperation(_Status,$00000010,DoneProc00000010);
 m2DoneOperation(_Status,$00000008,DoneProc00000008);
 m2DoneOperation(_Status,$00000004,DoneProc00000004);
 m2DoneOperation(_Status,$00000002,DoneProc00000002);
 m2DoneOperation(_Status,$00000001,DoneProc00000001);
 inherited;
end;

 function    Tm3IndexSearcher.GetDatePrefix(
                                           ): WideString;
 begin

  Result:=CDatePrefixValue;

 end;

 function    Tm3IndexSearcher.GetNumbPrefix(
                                           ): WideString;
 begin

  Result:=CNumbPrefixValue;

 end;

 function    Tm3IndexSearcher.GetTextPrefix(
                                           ): WideString;
 begin

  Result:=CTextPrefixValue;

 end;

function Tm3IndexSearcher.GetNormalizater(const ANormalizaterType: Tm3NormalizaterType): Im3Normalizater;
  {-}
begin
 case ANormalizaterType of
  Cm3NormalizaterInternal:
   Result:=FNormalizater;
  else
   OleError(STG_E_INVALIDFUNCTION);
 end;//case ANormalizaterType
end;

function Tm3IndexSearcher.GetResult(const ANormalizater : Im3Normalizater;
                                    const AValue        : WideString): Im3IndexSearcherResult;

 function __GetHashDataStorage(const ARootStorage: Im3IndexedStorage): Im3IndexedStorage;
 const
  CStatStgReadMode = STGM_READ or
                     STGM_SHARE_EXCLUSIVE or
                     STGM_DIRECT;
 begin
  Result := m3COMOpenStorage(ARootStorage, l3PCharLen(HashDataName), CStatStgReadMode, false);
 end;

 function __GetHashDataStream(const AHashDataStorage : Im3IndexedStorage;
                              const AValue           : WideString;
                              const AHashCount       : Word;
                              const AHashSize        : LongInt;
                              const AHashVersion     : Word): IStream;

  function __MakeHash(const AValue       : WideString;
                      const AHashCount   : Word;
                      const AHashSize    : LongInt;
                      const AHashVersion : Word): Word;
  begin
   Result:=Tm3HashHandleList.MakeHash(AValue,AHashCount,AHashSize,AHashVersion);
  end;

  function    __OpenStorage(const AStorage : Im3IndexedStorage;
                            anIndex        : Long): Im3IndexedStorage;
  const
   CStatStgReadMode = STGM_READ or
                      STGM_SHARE_EXCLUSIVE or
                      STGM_DIRECT;
  begin
   Result := m3COMOpenStorage(aStorage, anIndex, CStatStgReadMode, false);
  end;

  function __OpenStream(const AStorage : Im3IndexedStorage;
                        const AName    : Tl3PCharLen): IStream;
  const
   CStatStgReadMode = STGM_READ or
                      STGM_SHARE_EXCLUSIVE or
                      STGM_DIRECT;
  begin
   Result := m3COMOpenStream(aStorage, aName, CStatStgReadMode, false);
  end;

 begin//__GetHashDataStream
  try
   Result:=__OpenStream(__OpenStorage(AHashDataStorage,__MakeHash(AValue,AHashCount,AHashSize,AHashVersion)),l3PCharLen(AValue));
  except
   on E: EOleSysError do
    if (E.ErrorCode = STG_E_FILENOTFOUND) then
     Result:=nil
    else
     raise;
  end;//try..except
 end;//__GetHashDataStream

 procedure __GetHashInfo(const ARootStorage : Im3IndexedStorage;
                         var   AHashCount   : Word;
                         var   AHashSize    : LongInt;
                         var   AHashVersion : Word);
 const
  CStatStgReadMode = STGM_READ or
                     STGM_SHARE_EXCLUSIVE or
                     STGM_DIRECT;
 begin//__GetHashInfo
  with Tm3HashInfoStream.Create(m3COMOpenStream(ARootStorage,
                                                l3PCharLen(HashInfoName),
                                                CStatStgReadMode,False),
                                m2COMModeAccess(CStatStgReadMode)) do
   try
    with PHeaderData000(_HeaderData)^ do begin
     AHashCount:=RHashCount;
     AHashSize:=RHashSize;
     AHashVersion:=RHashVersion;
    end;//with PHeaderData000(_HeaderData)
   finally
    Free;
   end;
 end;//__GetHashInfo

 function __MergeHashData(var ASearchInfoArray: Tm3IdxClaSearchInfoArray): Im3IndexSearcherResult;

  function __Compare(const aItem1 : Pointer;
                     const aItem2 : Pointer;
                     const ASize  : LongInt): Integer;
  begin//__Compare
   if (aItem1 = nil) then begin
    if (aItem2 = nil) then
     Result := 0
    else
     Result := 1;
   end else begin
    if (aItem2 = nil) then
     Result := -1
    else
     Result:=FIndexComparer.Compare(AItem1, AItem2, aSize);
   end;//aItem1 = nil
  end;//__Compare

 var
  LBuffStream : Tm3BuffStream;
  LIndex      : Integer;
  LItem       : Pointer;
  LFound      : Integer;
  LTempStream : Tm3TempStream;
 begin//__MergeHashData
  LTempStream:=Tm3TempStream.Create;
  try
   LBuffStream:=Tm3BuffStream.Create(LTempStream);
   try
    repeat
     LItem:=nil;
     LFound:=-1;
     for LIndex:=0 to Pred(Length(ASearchInfoArray)) do begin
      with ASearchInfoArray[LIndex] do begin
        if (RStream <> nil) then begin
         if RNeedLoad then begin
          if FIndexReader.Get(RStream,RItem,FItemSize) then
           RNeedLoad := false
          else begin
           RStream := nil;
           Continue;
          end;//FIndexReader.Get
         end;//RNeedLoad
         case __Compare(RItem,LItem,FItemSize) of
          -1: begin
           LItem:=RItem;
           LFound:=LIndex;
          end;//-1
          00: RNeedLoad:=True;
         end;//case __Compare
        end;//RStream <> nil
      end;//with ASearchInfoArray[LIndex]
     end;//for LIndex
     if (LItem <> nil) then
      with ASearchInfoArray[LFound] do begin
       RNeedLoad:=True;
       FIndexWriter.Put(LBuffStream, RItem, FItemSize);
      end//with ASearchInfoArray[LFound]
     else
       Break;
    until False;
   finally
    l3Free(LBuffStream);
   end;//try..finally
   Result:=Tm3IndexSearcherResult.MakeInterface(LTempStream,FItemSize);
  finally
   l3Free(LTempStream);
  end;//try..finally
 end;//__MergeHashData

var
 LIndex           : Integer;
 LRootStorage     : Im3IndexedStorage;
 LSearchBuff      : Pointer;
 LSearchInfoArray : Tm3IdxClaSearchInfoArray;
 l_Count          : Long;
begin//GetResult
 LRootStorage:=FIndexStorageManager.GetRootStorage(True);
 try
  if (f_HashDataStorage = nil) then
   f_HashDataStorage := __GetHashDataStorage(LRootStorage);
  if not f_HasDataLoaded then begin
   __GetHashInfo(LRootStorage, f_HashCount, f_HashSize, f_HashVersion);
   f_HasDataLoaded := true;
  end;//not f_HasDataLoaded
  LRootStorage := nil; // - ����� ������ ��� ����� ����������
  if (aNormalizater = nil) then begin
   Result := Tm3LiveSearcherResult.Make(__GetHashDataStream(f_HashDataStorage,
                                        aValue,
                                        f_HashCount, f_HashSize, f_HashVersion),
                                        FItemSize);
  end else begin
   with ANormalizater.GetResult(AValue) do begin
    l_Count := GetCount;
(*    if (l_Count = 1) then begin
     // - ������� ���� - ������ ������ �� ���� ����������
     Result := Tm3LiveSearcherResult.Make(__GetHashDataStream(f_HashDataStorage,
                                          GetValue,
                                          f_HashCount, f_HashSize, f_HashVersion),
                                          FItemSize);
    end else *)begin
     m2MEMAlloc(LSearchBuff, l_Count * FItemSize);
     try
      SetLength(LSearchInfoArray, l_Count);
      try
       for LIndex:=Low(LSearchInfoArray) to High(LSearchInfoArray) do begin
        with LSearchInfoArray[LIndex] do begin
         RStream:=__GetHashDataStream(f_HashDataStorage,
                                      GetValue,
                                      f_HashCount, f_HashSize, f_HashVersion);
         RItem:=Pointer(LongInt(LSearchBuff)+(LIndex*FItemSize));
         RNeedLoad:=True;
        end;//with LSearchInfoArray[LIndex]
       end;//for LIndex
       Result := __MergeHashData(LSearchInfoArray);
      finally
       LSearchInfoArray := nil;
      end;//try..finally
     finally
      m2MEMFree(LSearchBuff);
     end;//try..finally
    end;//l_Count = 1
   end;//with ANormalizater.GetResult
  end;//aNormalizater = nil 
 finally
  LRootStorage:=nil;
 end;// try..finally
end;//GetResult

function Tm3IndexSearcher.GetWordsByMask(const aMask: WideString): Im3NormalizaterResult;
  {* - ���������� ������ ���� �� �����. }
var
 l_Normalizater : TNormalizater;
begin
 l_Normalizater := TNormalizater.Create(GetFileStreamMapView);
 try
  Result := l_Normalizater.GetWordsByMask(WideUpperCase(aMask))
 finally
  l3Free(l_Normalizater);
 end;//try..finally
end;
  
// Tm3IndexSearcher.end


// Tm3IndexSearcherResult.private

 function    Tm3IndexSearcherResult.InitProc00000001(const ABitMask: LongWord;
                                                     const AFileStream: Tm3FileStream
                                                    ): LongWord;
 begin

  with Self do
   begin

    FFileStreamMapView:=AFileStream.CreateMapView(PAGE_READONLY,FILE_MAP_READ);

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3IndexSearcherResult.DoneProc00000001(
                                                    );
 begin
  FreeAndNil(FFileStreamMapView);
 end;

 function    Tm3IndexSearcherResult.InitProc00000002(const ABitMask: LongWord;
                                                     const AItemSize: LongInt
                                                    ): LongWord;
 begin

  with Self do
   begin

    FItemSize:=AItemSize;

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3IndexSearcherResult.DoneProc00000002(
                                                    );
 begin

  with Self do
   begin
   end;

 end;

 function    Tm3IndexSearcherResult.InitProc00000004(const ABitMask: LongWord
                                                    ): LongWord;
 begin

  with Self do
   begin

    Reset();

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3IndexSearcherResult.DoneProc00000004(
                                                    );
 begin

  with Self do
   begin

    Reset();

   end;

 end;

// Tm3IndexSearcherResult.protected

// Tm3IndexSearcherResult.public

 class
 function    Tm3IndexSearcherResult.MakeInterface(const AFileStream: Tm3FileStream;
                                                  const AItemSize: LongInt
                                                 ): Im3IndexSearcherResult;
 begin

  with Create(AFileStream,AItemSize) do
   try

    Result:=Tm3IndexSearcherResult(Instance);

   finally

    Free;

   end;

 end;

 class
 function    Tm3IndexSearcherResult.MakeSafeInterface(out   AResult: Im3IndexSearcherResult;
                                                      const AFileStream: Tm3FileStream;
                                                      const AItemSize: LongInt
                                                     ): HRESULT;
 begin

  Result:=S_OK;
   try

    AResult:=MakeInterface(AFileStream,AItemSize);

   except

    on E: EOutOfMemory do Result:=STG_E_INSUFFICIENTMEMORY;
    on E: EOleSysError do Result:=E.ErrorCode;

   else

    Result:=E_UNEXPECTED;

   end;

 end;

 constructor Tm3IndexSearcherResult.Create(const AFileStream: Tm3FileStream;
                                           const AItemSize: LongInt
                                          );
 begin

  inherited Create();

  m2InitOperation(_Status,InitProc00000001($00000001,AFileStream));
  m2InitOperation(_Status,InitProc00000002($00000002,AItemSize));
  m2InitOperation(_Status,InitProc00000004($00000004));

 end;

procedure Tm3IndexSearcherResult.Cleanup;
begin
 m2DoneOperation(_Status,$00000004,DoneProc00000004);
 m2DoneOperation(_Status,$00000002,DoneProc00000002);
 m2DoneOperation(_Status,$00000001,DoneProc00000001);
 inherited;
end;

 procedure   Tm3IndexSearcherResult.Reset(
                                         );
 begin

  if (FFileStreamMapView <> nil)
   then
    begin

     with FFileStreamMapView do
      begin

       FItemBegPtr:=MemBase;
       FItemEndPtr:=Pointer(LongInt(FItemBegPtr)+MemSize);

      end;

    end;

 end;

 function    Tm3IndexSearcherResult.GetCount(
                                            ): LongInt;
 begin

  if (FFileStreamMapView <> nil)
   then
    begin

     with FFileStreamMapView do
      begin

       Result:=MemSize div FItemSize;

      end;

    end
   else
    begin

     Result:=0;

    end;

 end;

 function    Tm3IndexSearcherResult.Get(const AItem: Pointer;
                                        const AItemSize: LongInt
                                       ): LongBool;
 begin

  Assert(FItemSize = AItemSize);

  Result:=(LongInt(FItemBegPtr) <> LongInt(FItemEndPtr));

  if Result
   then
    begin

     m2MEMCopy(AItem,FItemBegPtr,FItemSize);
     Inc(LongInt(FItemBegPtr),FItemSize);

    end;

 end;

// Tm3IndexSearcherResult.end


// Tm3IndexStorageManager.private

 function    Tm3IndexStorageManager.InitProc00000001(const ABitMask: LongWord;
                                                     const AName: WideString
                                                    ): LongWord;
 begin

  with Self do
   begin

    FName:=AName;

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3IndexStorageManager.DoneProc00000001(
                                                    );
 begin

  with Self do
   begin

    SetLength(FName,0);

   end;

 end;

// Tm3IndexStorageManager.protected

// Tm3IndexStorageManager.public

 class
 function    Tm3IndexStorageManager.MakeInterface(const AName: WideString
                                                 ): Im3IndexStorageManager;
 begin

  with Create(AName) do
   try

    Result:=Tm3IndexStorageManager(Instance);

   finally

    Free;

   end;

 end;

 class
 function    Tm3IndexStorageManager.MakeSafeInterface(out   AResult: Im3IndexStorageManager;
                                                      const AName: WideString
                                                     ): HRESULT;
 begin

  Result:=S_OK;
   try

    AResult:=MakeInterface(AName);

   except

    on E: EOutOfMemory do Result:=STG_E_INSUFFICIENTMEMORY;
    on E: EOleSysError do Result:=E.ErrorCode;

   else

    Result:=E_UNEXPECTED;

   end;

 end;

 constructor Tm3IndexStorageManager.Create(const AName: WideString
                                          );
 begin

  inherited Create();

  m2InitOperation(_Status,InitProc00000001($00000001,AName));

 end;

procedure Tm3IndexStorageManager.Cleanup;
begin
 m2DoneOperation(_Status,$00000001,DoneProc00000001);
 inherited;
end;

function Tm3IndexStorageManager.GetRootStorage(const AReadOnly: LongBool): Im3IndexedStorage;
begin
 if AReadOnly then
  Result:=Tm3ReadModeStorageManager.MakeInterface(FName)
 else
  Result:=Tm3FullModeStorageManager.MakeInterface(FName);
end;

// Tm3IndexStorageManager.end


// Tm3Normalizater.private

// Tm3Normalizater.protected

// Tm3Normalizater.public

 class
 function    Tm3Normalizater.MakeInterface(
                                          ): Im3Normalizater;
 begin

  with Create() do
   try

    Result:=Tm3Normalizater(Instance);

   finally

    Free;

   end;

 end;

 class
 function    Tm3Normalizater.MakeSafeInterface(out   AResult: Im3Normalizater
                                              ): HRESULT;
 begin

  Result:=S_OK;
   try

    AResult:=MakeInterface();

   except

    on E: EOutOfMemory do Result:=STG_E_INSUFFICIENTMEMORY;
    on E: EOleSysError do Result:=E.ErrorCode;

   else

    Result:=E_UNEXPECTED;

   end;

 end;

function Tm3Normalizater.GetResult(const AValue : WideString;
                                   UsePseudo    : Boolean = true;
                                   UseAlternate : Boolean = false): Im3NormalizaterResult;
begin
 Result:=Tm3NormalizaterResult.MakeInterface(AValue);
end;

// Tm3Normalizater.end


// Tm3NormalizaterResult.private

 function    Tm3NormalizaterResult.InitProc00000001(const ABitMask: LongWord;
                                                    const AValue: WideString
                                                   ): LongWord;
 begin

  with Self do
   begin

    FValue:=AValue;

   end;

  Result:=ABitMask;

 end;

 procedure   Tm3NormalizaterResult.DoneProc00000001(
                                                   );
 begin

  with Self do
   begin

    SetLength(FValue,0);

   end;

 end;

// Tm3NormalizaterResult.protected

// Tm3NormalizaterResult.public

 class
 function    Tm3NormalizaterResult.MakeInterface(const AValue: WideString
                                                ): Im3NormalizaterResult;
 begin

  with Create(AValue) do
   try

    Result:=Tm3NormalizaterResult(Instance);

   finally

    Free;

   end;

 end;

 class
 function    Tm3NormalizaterResult.MakeSafeInterface(out   AResult: Im3NormalizaterResult;
                                                     const AValue: WideString
                                                    ): HRESULT;
 begin

  Result:=S_OK;
   try

    AResult:=MakeInterface(AValue);

   except

    on E: EOutOfMemory do Result:=STG_E_INSUFFICIENTMEMORY;
    on E: EOleSysError do Result:=E.ErrorCode;

   else

    Result:=E_UNEXPECTED;

   end;

 end;
                                                    
 constructor Tm3NormalizaterResult.Create(const AValue: WideString
                                         );
 begin

  inherited Create();

  m2InitOperation(_Status,InitProc00000001($00000001,AValue));

 end;

procedure Tm3NormalizaterResult.Cleanup;
begin
 m2DoneOperation(_Status,$00000001,DoneProc00000001);
 inherited;
end;

function Tm3NormalizaterResult.GetFlags: Tm3NormFlags;
  {* - ����� ���������� ������������. }
begin
 Result := [];
end;

 function    Tm3NormalizaterResult.GetCount(
                                           ): Integer;
 begin

  Result:=1;

 end;

 function    Tm3NormalizaterResult.GetValue(
                                           ): WideString;
 begin

  Result:=FValue;

 end;

procedure Tm3NormalizaterResult.Reset;
  {-}
begin
end;

// Tm3NormalizaterResult.end

{$IfDef m3AutoInitIndexManagers}
initialization
{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\m3\m3idxcla.pas initialization enter'); {$EndIf}
 g_BranchHandlesManager := Tl3SimpleMemoryManager.Create(64 * 1024 * Tm3BranchHandle.InstanceSize);
 g_WideStringManager := Tl3WideStringManager.Create(64 * 1024 * 8);
 g_NormalFormsManager := Tl3SizedPoolManager.Create(64 * 1024, 4);

{!touched!}{$IfDef LogInit} WriteLn('W:\common\components\rtl\Garant\m3\m3idxcla.pas initialization leave'); {$EndIf}
finalization
 l3Free(g_BranchHandlesManager);
 l3Free(g_WideStringManager);
 l3Free(g_NormalFormsManager);
{$EndIf m3AutoInitIndexManagers}

end.


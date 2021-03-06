// **********************************************************************
//
// Copyright (c) 2001 MT Tools.
//
// All Rights Reserved
//
// MT_DORB is based in part on the product DORB,
// written by Shadrin Victor
//
// See Readme.txt for contact information
//
// **********************************************************************
// automatically generated from code_set_registry.txt and mtdorb_code_set_registry.txt by mtdorb_cs_reg
unit codeset_ref;

interface

uses
  orbtypes;

const
  TCodesets : array[0..191] of TCodesetInfo = (
    (id:$00010001; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'ISO 8859-1:1987; Latin Alphabet No. 1'; name:'ofs00010001'),
    (id:$00010002; codepoint_size:1; max_codepoints:1; charsets:($0012, $0000, $0000, $0000, $0000); desc:'ISO 8859-2:1987; Latin Alphabet No. 2'; name:'ofs00010002'),
    (id:$00010003; codepoint_size:1; max_codepoints:1; charsets:($0013, $0000, $0000, $0000, $0000); desc:'ISO 8859-3:1988; Latin Alphabet No. 3'; name:'ofs00010003'),
    (id:$00010004; codepoint_size:1; max_codepoints:1; charsets:($0014, $0000, $0000, $0000, $0000); desc:'ISO 8859-4:1988; Latin Alphabet No. 4'; name:'ofs00010004'),
    (id:$00010005; codepoint_size:1; max_codepoints:1; charsets:($0015, $0000, $0000, $0000, $0000); desc:'ISO/IEC 8859-5:1988; Latin-Cyrillic Alphabet'; name:'ofs00010005'),
    (id:$00010006; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'ISO 8859-6:1987; Latin-Arabic Alphabet'; name:'ofs00010006'),
    (id:$00010007; codepoint_size:1; max_codepoints:1; charsets:($0017, $0000, $0000, $0000, $0000); desc:'ISO 8859-7:1987; Latin-Greek Alphabet'; name:'ofs00010007'),
    (id:$00010008; codepoint_size:1; max_codepoints:1; charsets:($0018, $0000, $0000, $0000, $0000); desc:'ISO 8859-8:1988; Latin-Hebrew Alphabet'; name:'ofs00010008'),
    (id:$00010009; codepoint_size:1; max_codepoints:1; charsets:($0019, $0000, $0000, $0000, $0000); desc:'ISO/IEC 8859-9:1989; Latin Alphabet No. 5'; name:'ofs00010009'),
    (id:$0001000A; codepoint_size:1; max_codepoints:1; charsets:($001A, $0000, $0000, $0000, $0000); desc:'ISO/IEC 8859-10:1992; Latin Alphabet No. 6'; name:'ofs0001000A'),
    (id:$00010020; codepoint_size:1; max_codepoints:1; charsets:($0001, $0000, $0000, $0000, $0000); desc:'ISO 646:1991 IRV (International Reference Version)'; name:'ofs00010020'),
    (id:$00010100; codepoint_size:2; max_codepoints:1; charsets:($1000, $0000, $0000, $0000, $0000); desc:'ISO/IEC 10646-1:1993; UCS-2, Level 1'; name:'ofs00010100'),
    (id:$00010101; codepoint_size:2; max_codepoints:1; charsets:($1000, $0000, $0000, $0000, $0000); desc:'ISO/IEC 10646-1:1993; UCS-2, Level 2'; name:'ofs00010101'),
    (id:$00010102; codepoint_size:2; max_codepoints:1; charsets:($1000, $0000, $0000, $0000, $0000); desc:'ISO/IEC 10646-1:1993; UCS-2, Level 3'; name:'ofs00010102'),
    (id:$00010104; codepoint_size:4; max_codepoints:1; charsets:($1000, $0000, $0000, $0000, $0000); desc:'ISO/IEC 10646-1:1993; UCS-4, Level 1'; name:'ofs00010104'),
    (id:$00010105; codepoint_size:4; max_codepoints:1; charsets:($1000, $0000, $0000, $0000, $0000); desc:'ISO/IEC 10646-1:1993; UCS-4, Level 2'; name:'ofs00010105'),
    (id:$00010106; codepoint_size:4; max_codepoints:1; charsets:($1000, $0000, $0000, $0000, $0000); desc:'ISO/IEC 10646-1:1993; UCS-4, Level 3'; name:'ofs00010106'),
    (id:$00010108; codepoint_size:1; max_codepoints:5; charsets:($1000, $0000, $0000, $0000, $0000); desc:'ISO/IEC 10646-1:1993; UTF-1, UCS Transformation Format 1'; name:'ofs00010108'),
    (id:$00010109; codepoint_size:2; max_codepoints:2; charsets:($1000, $0000, $0000, $0000, $0000); desc:'ISO/IEC 10646-1:1993; UTF-16, UCS Transformation Format 16-bit form'; name:'ofs00010109'),
    (id:$00030001; codepoint_size:1; max_codepoints:1; charsets:($0080, $0000, $0000, $0000, $0000); desc:'JIS X0201:1976; Japanese phonetic characters'; name:'ofs00030001'),
    (id:$00030004; codepoint_size:1; max_codepoints:2; charsets:($0081, $0000, $0000, $0000, $0000); desc:'JIS X0208:1978 Japanese Kanji Graphic Characters'; name:'ofs00030004'),
    (id:$00030005; codepoint_size:1; max_codepoints:2; charsets:($0081, $0000, $0000, $0000, $0000); desc:'JIS X0208:1983 Japanese Kanji Graphic Characters'; name:'ofs00030005'),
    (id:$00030006; codepoint_size:1; max_codepoints:2; charsets:($0081, $0000, $0000, $0000, $0000); desc:'JIS X0208:1990 Japanese Kanji Graphic Characters'; name:'ofs00030006'),
    (id:$0003000A; codepoint_size:1; max_codepoints:2; charsets:($0082, $0000, $0000, $0000, $0000); desc:'JIS X0212:1990; Supplementary Japanese Kanji Graphic Chars'; name:'ofs0003000A'),
    (id:$00030010; codepoint_size:1; max_codepoints:3; charsets:($0011, $0080, $0081, $0082, $0000); desc:'JIS eucJP:1993; Japanese EUC'; name:'ofs00030010'),
    (id:$00040001; codepoint_size:1; max_codepoints:2; charsets:($0100, $0000, $0000, $0000, $0000); desc:'KS C5601:1987; Korean Hangul and Hanja Graphic Characters'; name:'ofs00040001'),
    (id:$00040002; codepoint_size:1; max_codepoints:2; charsets:($0101, $0000, $0000, $0000, $0000); desc:'KS C5657:1991; Supplementary Korean Graphic Characters'; name:'ofs00040002'),
    (id:$0004000A; codepoint_size:1; max_codepoints:2; charsets:($0011, $0100, $0101, $0000, $0000); desc:'KS eucKR:1991; Korean EUC'; name:'ofs0004000A'),
    (id:$00050001; codepoint_size:1; max_codepoints:2; charsets:($0180, $0000, $0000, $0000, $0000); desc:'CNS 11643:1986; Taiwanese Hanzi Graphic Characters'; name:'ofs00050001'),
    (id:$00000000; codepoint_size:1; max_codepoints:0; charsets:($0000, $0000, $0000, $0000, $0000); desc:'CNS 11643:1992; Taiwanese Extended Hanzi Graphic Chars'; name:'ofs00000000'),
    (id:$0005000A; codepoint_size:1; max_codepoints:4; charsets:($0001, $0180, $0000, $0000, $0000); desc:'CNS eucTW:1991; Taiwanese EUC'; name:'ofs0005000A'),
    (id:$00050010; codepoint_size:1; max_codepoints:4; charsets:($0001, $0181, $0000, $0000, $0000); desc:'CNS eucTW:1993; Taiwanese EUC'; name:'ofs00050010'),
    (id:$000B0001; codepoint_size:1; max_codepoints:1; charsets:($0200, $0000, $0000, $0000, $0000); desc:'TIS 620-2529, Thai characters'; name:'ofs000B0001'),
    (id:$000D0001; codepoint_size:1; max_codepoints:2; charsets:($0180, $0000, $0000, $0000, $0000); desc:'TTB CCDC:1984; Chinese Code for Data Communications'; name:'ofs000D0001'),
    (id:$05000010; codepoint_size:1; max_codepoints:2; charsets:($0001, $0080, $0081, $0000, $0000); desc:'OSF Japanese UJIS'; name:'ofs05000010'),
    (id:$05000011; codepoint_size:1; max_codepoints:2; charsets:($0001, $0080, $0081, $0000, $0000); desc:'OSF Japanese SJIS-1'; name:'ofs05000011'),
    (id:$05000012; codepoint_size:1; max_codepoints:2; charsets:($0001, $0080, $0081, $0000, $0000); desc:'OSF Japanese SJIS-2'; name:'ofs05000012'),
    (id:$05010001; codepoint_size:1; max_codepoints:6; charsets:($1000, $0000, $0000, $0000, $0000); desc:'X/Open UTF-8; UCS Transformation Format 8 (UTF-8)'; name:'ofs05010001'),
    (id:$05020001; codepoint_size:1; max_codepoints:3; charsets:($0001, $0080, $0081, $0082, $0000); desc:'JVC_eucJP'; name:'ofs05020001'),
    (id:$05020002; codepoint_size:1; max_codepoints:2; charsets:($0001, $0080, $0081, $0000, $0000); desc:'JVC_SJIS'; name:'ofs05020002'),
    (id:$10000001; codepoint_size:1; max_codepoints:2; charsets:($0011, $0080, $0081, $0000, $0000); desc:'DEC Kanji'; name:'ofs10000001'),
    (id:$10000002; codepoint_size:1; max_codepoints:3; charsets:($0011, $0080, $0081, $0082, $0000); desc:'Super DEC Kanji'; name:'ofs10000002'),
    (id:$10000003; codepoint_size:1; max_codepoints:2; charsets:($0011, $0080, $0081, $0000, $0000); desc:'DEC Shift JIS'; name:'ofs10000003'),
    (id:$10010001; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'HP roman8; English and Western European languages'; name:'ofs10010001'),
    (id:$10010002; codepoint_size:1; max_codepoints:1; charsets:($0080, $0000, $0000, $0000, $0000); desc:'HP kana8; Japanese katakana (incl JIS X0201:1976)'; name:'ofs10010002'),
    (id:$10010003; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'HP arabic8; Arabic'; name:'ofs10010003'),
    (id:$10010004; codepoint_size:1; max_codepoints:1; charsets:($0017, $0000, $0000, $0000, $0000); desc:'HP greek8; Greek'; name:'ofs10010004'),
    (id:$10010005; codepoint_size:1; max_codepoints:1; charsets:($0018, $0000, $0000, $0000, $0000); desc:'HP hebrew8; Hebrew'; name:'ofs10010005'),
    (id:$10010006; codepoint_size:1; max_codepoints:1; charsets:($0013, $0019, $0000, $0000, $0000); desc:'HP turkish8; Turkish'; name:'ofs10010006'),
    (id:$10010007; codepoint_size:1; max_codepoints:2; charsets:($0001, $0300, $0000, $0000, $0000); desc:'HP15CN; encoding method for Simplified Chinese'; name:'ofs10010007'),
    (id:$10010008; codepoint_size:1; max_codepoints:2; charsets:($0001, $0180, $0000, $0000, $0000); desc:'HP big5; encoding method for Traditional Chinese'; name:'ofs10010008'),
    (id:$10010009; codepoint_size:1; max_codepoints:2; charsets:($0001, $0080, $0081, $0000, $0000); desc:'HP japanese15 (sjis); Shift-JIS for mainframe (incl JIS X0208:1990)'; name:'ofs10010009'),
    (id:$1001000A; codepoint_size:1; max_codepoints:2; charsets:($0001, $0080, $0081, $0000, $0000); desc:'HP sjishi; Shift-JIS for HP user (incl JIS X0208:1990)'; name:'ofs1001000A'),
    (id:$1001000B; codepoint_size:1; max_codepoints:2; charsets:($0001, $0080, $0081, $0000, $0000); desc:'HP sjispc; Shift-JIS for PC (incl JIS X0208:1990)'; name:'ofs1001000B'),
    (id:$1001000C; codepoint_size:1; max_codepoints:2; charsets:($0001, $0080, $0081, $0000, $0000); desc:'HP ujis; EUC (incl JIS X0208:1990)'; name:'ofs1001000C'),
    (id:$10020025; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-037 (CCSID 00037); CECP for USA, Canada, NL, Ptgl, Brazil, Australia, NZ'; name:'ofs10020025'),
    (id:$10020111; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-273 (CCSID 00273); CECP for Austria, Germany'; name:'ofs10020111'),
    (id:$10020115; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-277 (CCSID 00277); CECP for Denmark, Norway'; name:'ofs10020115'),
    (id:$10020116; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-278 (CCSID 00278); CECP for Finland, Sweden'; name:'ofs10020116'),
    (id:$10020118; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-280 (CCSID 00280); CECP for Italy'; name:'ofs10020118'),
    (id:$1002011A; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-282 (CCSID 00282); CECP for Portugal'; name:'ofs1002011A'),
    (id:$1002011C; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-284 (CCSID 00284); CECP for Spain, Latin America (Spanish)'; name:'ofs1002011C'),
    (id:$1002011D; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-285 (CCSID 00285); CECP for United Kingdom'; name:'ofs1002011D'),
    (id:$10020122; codepoint_size:1; max_codepoints:1; charsets:($0080, $0000, $0000, $0000, $0000); desc:'IBM-290 (CCSID 00290); Japanese Katakana Host Ext SBCS'; name:'ofs10020122'),
    (id:$10020129; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-297 (CCSID 00297); CECP for France'; name:'ofs10020129'),
    (id:$1002012C; codepoint_size:1; max_codepoints:2; charsets:($0081, $0000, $0000, $0000, $0000); desc:'IBM-300 (CCSID 00300); Japanese Host DBCS incl 4370 UDC'; name:'ofs1002012C'),
    (id:$1002012D; codepoint_size:1; max_codepoints:2; charsets:($0081, $0000, $0000, $0000, $0000); desc:'IBM-301 (CCSID 00301); Japanese PC Data DBCS incl 1880 UDC'; name:'ofs1002012D'),
    (id:$100201A4; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'IBM-420 (CCSID 00420); Arabic (presentation shapes)'; name:'ofs100201A4'),
    (id:$100201A8; codepoint_size:1; max_codepoints:1; charsets:($0018, $0000, $0000, $0000, $0000); desc:'IBM-424 (CCSID 00424); Hebrew'; name:'ofs100201A8'),
    (id:$100201B5; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-437 (CCSID 00437); PC USA'; name:'ofs100201B5'),
    (id:$100201F4; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-500 (CCSID 00500); CECP for Belgium, Switzerland'; name:'ofs100201F4'),
    (id:$00000000; codepoint_size:1; max_codepoints:0; charsets:($0000, $0000, $0000, $0000, $0000); desc:'IBM-833 (CCSID 00833); Korean Host Extended SBCS'; name:'ofs00000000'),
    (id:$10020342; codepoint_size:1; max_codepoints:2; charsets:($0100, $0000, $0000, $0000, $0000); desc:'IBM-834 (CCSID 00834); Korean Host DBCS incl 1227 UDC'; name:'ofs10020342'),
    (id:$10020343; codepoint_size:1; max_codepoints:2; charsets:($0180, $0000, $0000, $0000, $0000); desc:'IBM-835 (CCSID 00835); T-Ch Host DBCS incl 6204 UDC'; name:'ofs10020343'),
    (id:$00000000; codepoint_size:1; max_codepoints:0; charsets:($0000, $0000, $0000, $0000, $0000); desc:'IBM-836 (CCSID 00836); S-Ch Host Extended SBCS'; name:'ofs00000000'),
    (id:$10020345; codepoint_size:1; max_codepoints:2; charsets:($0300, $0000, $0000, $0000, $0000); desc:'IBM-837 (CCSID 00837); S-Ch Host DBCS incl 1880 UDC'; name:'ofs10020345'),
    (id:$00000000; codepoint_size:1; max_codepoints:0; charsets:($0000, $0000, $0000, $0000, $0000); desc:'IBM-838 (CCSID 00838); Thai Host Extended SBCS'; name:'ofs00000000'),
    (id:$10020347; codepoint_size:1; max_codepoints:2; charsets:($0200, $0000, $0000, $0000, $0000); desc:'IBM-839 (CCSID 00839); Thai Host DBCS incl 374 UDC'; name:'ofs10020347'),
    (id:$10020352; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-850 (CCSID 00850); Multilingual IBM PC Data-MLP 222'; name:'ofs10020352'),
    (id:$10020354; codepoint_size:1; max_codepoints:1; charsets:($0012, $0000, $0000, $0000, $0000); desc:'IBM-852 (CCSID 00852); Multilingual Latin-2'; name:'ofs10020354'),
    (id:$10020357; codepoint_size:1; max_codepoints:1; charsets:($0015, $0000, $0000, $0000, $0000); desc:'IBM-855 (CCSID 00855); Cyrillic PC Data'; name:'ofs10020357'),
    (id:$10020358; codepoint_size:1; max_codepoints:1; charsets:($0018, $0000, $0000, $0000, $0000); desc:'IBM-856 (CCSID 00856); Hebrew PC Data (extensions)'; name:'ofs10020358'),
    (id:$10020359; codepoint_size:1; max_codepoints:1; charsets:($0019, $0000, $0000, $0000, $0000); desc:'IBM-857 (CCSID 00857); Turkish Latin-5 PC Data'; name:'ofs10020359'),
    (id:$1002035D; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-861 (CCSID 00861); PC Data Iceland'; name:'ofs1002035D'),
    (id:$1002035E; codepoint_size:1; max_codepoints:1; charsets:($0018, $0000, $0000, $0000, $0000); desc:'IBM-862 (CCSID 00862); PC Data Hebrew'; name:'ofs1002035E'),
    (id:$1002035F; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-863 (CCSID 00863); PC Data Canadian French'; name:'ofs1002035F'),
    (id:$10020360; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'IBM-864 (CCSID 00864); Arabic PC Data'; name:'ofs10020360'),
    (id:$10020362; codepoint_size:1; max_codepoints:1; charsets:($0015, $0000, $0000, $0000, $0000); desc:'IBM-866 (CCSID 00866); PC Data Cyrillic 2'; name:'ofs10020362'),
    (id:$10020364; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'IBM-868 (CCSID 00868); Urdu PC Data'; name:'ofs10020364'),
    (id:$10020365; codepoint_size:1; max_codepoints:1; charsets:($0017, $0000, $0000, $0000, $0000); desc:'IBM-869 (CCSID 00869); Greek PC Data'; name:'ofs10020365'),
    (id:$10020366; codepoint_size:1; max_codepoints:1; charsets:($0012, $0000, $0000, $0000, $0000); desc:'IBM-870 (CCSID 00870); Multilingual Latin-2 EBCDIC'; name:'ofs10020366'),
    (id:$10020367; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-871 (CCSID 00871); CECP for Iceland'; name:'ofs10020367'),
    (id:$00000000; codepoint_size:1; max_codepoints:0; charsets:($0000, $0000, $0000, $0000, $0000); desc:'IBM-874 (CCSID 00874); Thai PC Display Extended SBCS'; name:'ofs00000000'),
    (id:$1002036B; codepoint_size:1; max_codepoints:1; charsets:($0017, $0000, $0000, $0000, $0000); desc:'IBM-875 (CCSID 00875); Greek'; name:'ofs1002036B'),
    (id:$10020370; codepoint_size:1; max_codepoints:1; charsets:($0015, $0000, $0000, $0000, $0000); desc:'IBM-880 (CCSID 00880); Multilingual Cyrillic'; name:'ofs10020370'),
    (id:$1002037B; codepoint_size:1; max_codepoints:1; charsets:($0001, $0000, $0000, $0000, $0000); desc:'IBM-891 (CCSID 00891); Korean PC Data SBCS'; name:'ofs1002037B'),
    (id:$10020380; codepoint_size:1; max_codepoints:1; charsets:($0080, $0000, $0000, $0000, $0000); desc:'IBM-896 (CCSID 00896); Japanese Katakana characters; superset of JIS X0201:1976'; name:'ofs10020380'),
    (id:$10020381; codepoint_size:1; max_codepoints:1; charsets:($0080, $0000, $0000, $0000, $0000); desc:'IBM-897 (CCSID 00897); PC Data Japanese SBCS (use with CP 00301)'; name:'ofs10020381'),
    (id:$10020387; codepoint_size:1; max_codepoints:1; charsets:($0001, $0000, $0000, $0000, $0000); desc:'IBM-903 (CCSID 00903); PC Data Simplified Chinese SBCS (use with  DBCS)'; name:'ofs10020387'),
    (id:$10020388; codepoint_size:1; max_codepoints:1; charsets:($0001, $0000, $0000, $0000, $0000); desc:'IBM-904 (CCSID 00904); PC Data Traditional Chinese SBCS (use with  DBCS)'; name:'ofs10020388'),
    (id:$10020396; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'IBM-918 (CCSID 00918); Urdu'; name:'ofs10020396'),
    (id:$10020399; codepoint_size:1; max_codepoints:1; charsets:($001A, $0000, $0000, $0000, $0000); desc:'IBM-921 (CCSID 00921); Baltic 8-Bit'; name:'ofs10020399'),
    (id:$1002039A; codepoint_size:1; max_codepoints:1; charsets:($001A, $0000, $0000, $0000, $0000); desc:'IBM-922 (CCSID 00922); Estonia 8-Bit'; name:'ofs1002039A'),
    (id:$1002039E; codepoint_size:1; max_codepoints:2; charsets:($0100, $0000, $0000, $0000, $0000); desc:'IBM-926 (CCSID 00926); Korean PC Data DBCS incl 1880 UDC'; name:'ofs1002039E'),
    (id:$1002039F; codepoint_size:1; max_codepoints:2; charsets:($0180, $0000, $0000, $0000, $0000); desc:'IBM-927 (CCSID 00927); T-Ch PC Data DBCS incl 6204 UDC'; name:'ofs1002039F'),
    (id:$100203A0; codepoint_size:1; max_codepoints:2; charsets:($0300, $0000, $0000, $0000, $0000); desc:'IBM-928 (CCSID 00928); S-Ch PC Data DBCS incl 1880 UDC'; name:'ofs100203A0'),
    (id:$100203A1; codepoint_size:1; max_codepoints:2; charsets:($0200, $0000, $0000, $0000, $0000); desc:'IBM-929 (CCSID 00929); Thai PC Data DBCS incl 374 UDC'; name:'ofs100203A1'),
    (id:$100203A2; codepoint_size:1; max_codepoints:2; charsets:($0080, $0081, $0000, $0000, $0000); desc:'IBM-930 (CCSID 00930); Kat-Kanji Host MBCS Ext-SBCS'; name:'ofs100203A2'),
    (id:$100203A4; codepoint_size:1; max_codepoints:2; charsets:($0080, $0081, $0000, $0000, $0000); desc:'IBM-932 (CCSID 00932); Japanese PC Data Mixed'; name:'ofs100203A4'),
    (id:$00000000; codepoint_size:1; max_codepoints:0; charsets:($0000, $0000, $0000, $0000, $0000); desc:'IBM-933 (CCSID 00933); Korean Host Extended SBCS'; name:'ofs00000000'),
    (id:$100203A6; codepoint_size:1; max_codepoints:2; charsets:($0001, $0100, $0000, $0000, $0000); desc:'IBM-934 (CCSID 00934); Korean PC Data Mixed'; name:'ofs100203A6'),
    (id:$100203A7; codepoint_size:1; max_codepoints:2; charsets:($0001, $0300, $0000, $0000, $0000); desc:'IBM-935 (CCSID 00935); S-Ch Host Mixed'; name:'ofs100203A7'),
    (id:$100203A8; codepoint_size:1; max_codepoints:2; charsets:($0001, $0300, $0000, $0000, $0000); desc:'IBM-936 (CCSID 00936); PC Data S-Ch MBCS'; name:'ofs100203A8'),
    (id:$100203A9; codepoint_size:1; max_codepoints:2; charsets:($0001, $0180, $0000, $0000, $0000); desc:'IBM-937 (CCSID 00937); T-Ch Host Mixed'; name:'ofs100203A9'),
    (id:$100203AA; codepoint_size:1; max_codepoints:2; charsets:($0001, $0180, $0000, $0000, $0000); desc:'IBM-938 (CCSID 00938); PC Data T-Ch MBCS'; name:'ofs100203AA'),
    (id:$100203AB; codepoint_size:1; max_codepoints:2; charsets:($0080, $0081, $0000, $0000, $0000); desc:'IBM-939 (CCSID 00939); Latin-Kanji Host MBCS'; name:'ofs100203AB'),
    (id:$100203AD; codepoint_size:1; max_codepoints:2; charsets:($0081, $0000, $0000, $0000, $0000); desc:'IBM-941 (CCSID 00941); Japanese PC DBCS for Open'; name:'ofs100203AD'),
    (id:$100203AE; codepoint_size:1; max_codepoints:2; charsets:($0080, $0081, $0000, $0000, $0000); desc:'IBM-942 (CCSID 00942); Japanese PC Data Mixed'; name:'ofs100203AE'),
    (id:$100203AF; codepoint_size:1; max_codepoints:2; charsets:($0080, $0081, $0000, $0000, $0000); desc:'IBM-943 (CCSID 00943); Japanese PC MBCS for Open'; name:'ofs100203AF'),
    (id:$100203B2; codepoint_size:1; max_codepoints:2; charsets:($0001, $0300, $0000, $0000, $0000); desc:'IBM-946 (CCSID 00946); S-Ch PC Data Mixed'; name:'ofs100203B2'),
    (id:$100203B3; codepoint_size:1; max_codepoints:2; charsets:($0180, $0000, $0000, $0000, $0000); desc:'IBM-947 (CCSID 00947); T-Ch PC Data DBCS incl 6204 UDC'; name:'ofs100203B3'),
    (id:$100203B4; codepoint_size:1; max_codepoints:2; charsets:($0001, $0180, $0000, $0000, $0000); desc:'IBM-948 (CCSID 00948); T-Ch PC Data Mixed'; name:'ofs100203B4'),
    (id:$100203B5; codepoint_size:1; max_codepoints:2; charsets:($0001, $0100, $0000, $0000, $0000); desc:'IBM-949 (CCSID 00949); IBM KS PC Data Mixed'; name:'ofs100203B5'),
    (id:$100203B6; codepoint_size:1; max_codepoints:2; charsets:($0001, $0180, $0000, $0000, $0000); desc:'IBM-950 (CCSID 00950); T-Ch PC Data Mixed'; name:'ofs100203B6'),
    (id:$100203B7; codepoint_size:1; max_codepoints:2; charsets:($0100, $0000, $0000, $0000, $0000); desc:'IBM-951 (CCSID 00951); IBM KS PC Data DBCS incl 1880 UDC'; name:'ofs100203B7'),
    (id:$100203BB; codepoint_size:1; max_codepoints:2; charsets:($0081, $0000, $0000, $0000, $0000); desc:'IBM-955 (CCSID 00955); Japan Kanji characters; superset of JIS X0208:1978'; name:'ofs100203BB'),
    (id:$100203C4; codepoint_size:1; max_codepoints:4; charsets:($0001, $0180, $0000, $0000, $0000); desc:'IBM-964 (CCSID 00964); T-Chinese EUC CNS1163 plane 1,2'; name:'ofs100203C4'),
    (id:$100203CA; codepoint_size:1; max_codepoints:2; charsets:($0011, $0100, $0101, $0000, $0000); desc:'IBM-970 (CCSID 00970); Korean EUC'; name:'ofs100203CA'),
    (id:$100203EE; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'IBM-1006 (CCSID 01006); Urdu 8-bit'; name:'ofs100203EE'),
    (id:$10020401; codepoint_size:1; max_codepoints:1; charsets:($0015, $0000, $0000, $0000, $0000); desc:'IBM-1025 (CCSID 01025); Cyrillic Multilingual'; name:'ofs10020401'),
    (id:$10020402; codepoint_size:1; max_codepoints:1; charsets:($0019, $0000, $0000, $0000, $0000); desc:'IBM-1026 (CCSID 01026); Turkish Latin-5'; name:'ofs10020402'),
    (id:$10020403; codepoint_size:1; max_codepoints:1; charsets:($0080, $0000, $0000, $0000, $0000); desc:'IBM-1027 (CCSID 01027); Japanese Latin Host Ext SBCS'; name:'ofs10020403'),
    (id:$00000000; codepoint_size:1; max_codepoints:0; charsets:($0000, $0000, $0000, $0000, $0000); desc:'IBM-1040 (CCSID 01040); Korean PC Data Extended SBCS'; name:'ofs00000000'),
    (id:$00000000; codepoint_size:1; max_codepoints:0; charsets:($0000, $0000, $0000, $0000, $0000); desc:'IBM-1041 (CCSID 01041); Japanese PC Data Extended SBCS'; name:'ofs00000000'),
    (id:$00000000; codepoint_size:1; max_codepoints:0; charsets:($0000, $0000, $0000, $0000, $0000); desc:'IBM-1043 (CCSID 01043); T-Ch PC Data Extended SBCS'; name:'ofs00000000'),
    (id:$10020416; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'IBM-1046 (CCSID 01046); Arabic PC Data'; name:'ofs10020416'),
    (id:$10020417; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-1047 (CCSID 01047); Latin-1 Open System'; name:'ofs10020417'),
    (id:$10020440; codepoint_size:1; max_codepoints:1; charsets:($0001, $0000, $0000, $0000, $0000); desc:'IBM-1088 (CCSID 01088); IBM KS Code PC Data SBCS'; name:'ofs10020440'),
    (id:$10020449; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'IBM-1097 (CCSID 01097); Farsi'; name:'ofs10020449'),
    (id:$1002044A; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'IBM-1098 (CCSID 01098); Farsi PC Data'; name:'ofs1002044A'),
    (id:$10020458; codepoint_size:1; max_codepoints:1; charsets:($001A, $0000, $0000, $0000, $0000); desc:'IBM-1112 (CCSID 01112); Baltic Multilingual'; name:'ofs10020458'),
    (id:$1002045A; codepoint_size:1; max_codepoints:1; charsets:($0001, $0000, $0000, $0000, $0000); desc:'IBM-1114 (CCSID 01114); T-Ch PC Data SBCS (IBM BIG-5)'; name:'ofs1002045A'),
    (id:$1002045B; codepoint_size:1; max_codepoints:1; charsets:($0001, $0000, $0000, $0000, $0000); desc:'IBM-1115 (CCSID 01115); S-Ch PC Data SBCS (IBM GB)'; name:'ofs1002045B'),
    (id:$10020462; codepoint_size:1; max_codepoints:1; charsets:($001A, $0000, $0000, $0000, $0000); desc:'IBM-1122 (CCSID 01122); Estonia'; name:'ofs10020462'),
    (id:$100204E2; codepoint_size:1; max_codepoints:1; charsets:($0012, $0000, $0000, $0000, $0000); desc:'IBM-1250 (CCSID 01250); MS Windows Latin-2'; name:'ofs100204E2'),
    (id:$100204E3; codepoint_size:1; max_codepoints:1; charsets:($0015, $0000, $0000, $0000, $0000); desc:'IBM-1251 (CCSID 01251); MS Windows Cyrillic'; name:'ofs100204E3'),
    (id:$100204E4; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-1252 (CCSID 01252); MS Windows Latin-1'; name:'ofs100204E4'),
    (id:$100204E5; codepoint_size:1; max_codepoints:1; charsets:($0017, $0000, $0000, $0000, $0000); desc:'IBM-1253 (CCSID 01253); MS Windows Greek'; name:'ofs100204E5'),
    (id:$100204E6; codepoint_size:1; max_codepoints:1; charsets:($0019, $0000, $0000, $0000, $0000); desc:'IBM-1254 (CCSID 01254); MS Windows Turkey'; name:'ofs100204E6'),
    (id:$100204E7; codepoint_size:1; max_codepoints:1; charsets:($0018, $0000, $0000, $0000, $0000); desc:'IBM-1255 (CCSID 01255); MS Windows Hebrew'; name:'ofs100204E7'),
    (id:$100204E8; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'IBM-1256 (CCSID 01256); MS Windows Arabic'; name:'ofs100204E8'),
    (id:$100204E9; codepoint_size:1; max_codepoints:1; charsets:($001A, $0000, $0000, $0000, $0000); desc:'IBM-1257 (CCSID 01257); MS Windows Baltic'; name:'ofs100204E9'),
    (id:$10020564; codepoint_size:1; max_codepoints:2; charsets:($0300, $0000, $0000, $0000, $0000); desc:'IBM-1380 (CCSID 01380); S-Ch PC Data DBCS incl 1880 UDC'; name:'ofs10020564'),
    (id:$10020565; codepoint_size:1; max_codepoints:2; charsets:($0001, $0300, $0000, $0000, $0000); desc:'IBM-1381 (CCSID 01381); S-Ch PC Data Mixed incl 1880 UDC'; name:'ofs10020565'),
    (id:$10020567; codepoint_size:1; max_codepoints:3; charsets:($0001, $0300, $0000, $0000, $0000); desc:'IBM-1383 (CCSID 01383); S-Ch EUC GB 2312-80 set (1382)'; name:'ofs10020567'),
    (id:$1002112C; codepoint_size:1; max_codepoints:2; charsets:($0081, $0000, $0000, $0000, $0000); desc:'IBM-300 (CCSID 04396); Japanese Host DBCS incl 1880 UDC'; name:'ofs1002112C'),
    (id:$10021352; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-850 (CCSID 04946); Multilingual IBM PC Data-190'; name:'ofs10021352'),
    (id:$10021354; codepoint_size:1; max_codepoints:1; charsets:($0012, $0000, $0000, $0000, $0000); desc:'IBM-852 (CCSID 04948); Latin-2 Personal Computer'; name:'ofs10021354'),
    (id:$10021357; codepoint_size:1; max_codepoints:1; charsets:($0015, $0000, $0000, $0000, $0000); desc:'IBM-855 (CCSID 04951); Cyrillic Personal Computer'; name:'ofs10021357'),
    (id:$10021358; codepoint_size:1; max_codepoints:1; charsets:($0018, $0000, $0000, $0000, $0000); desc:'IBM-856 (CCSID 04952); Hebrew PC Data'; name:'ofs10021358'),
    (id:$10021359; codepoint_size:1; max_codepoints:1; charsets:($0019, $0000, $0000, $0000, $0000); desc:'IBM-857 (CCSID 04953); Turkish Latin-5 PC Data'; name:'ofs10021359'),
    (id:$10021360; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'IBM-864 (CCSID 04960); Arabic PC Data (all shapes)'; name:'ofs10021360'),
    (id:$10021364; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'IBM-868 (CCSID 04964); PC Data for Urdu'; name:'ofs10021364'),
    (id:$10021365; codepoint_size:1; max_codepoints:1; charsets:($0017, $0000, $0000, $0000, $0000); desc:'IBM-869 (CCSID 04965); Greek PC Data'; name:'ofs10021365'),
    (id:$100213A2; codepoint_size:1; max_codepoints:2; charsets:($0080, $0081, $0000, $0000, $0000); desc:'IBM-5026 (CCSID 05026); Japanese Katakana-Kanji Host Mixed'; name:'ofs100213A2'),
    (id:$100213A7; codepoint_size:1; max_codepoints:2; charsets:($0001, $0300, $0000, $0000, $0000); desc:'IBM-5031 (CCSID 05031); S-Ch Host MBCS'; name:'ofs100213A7'),
    (id:$100213AB; codepoint_size:1; max_codepoints:2; charsets:($0080, $0081, $0000, $0000, $0000); desc:'IBM-1027 and -300 (CCSID 05035); Japanese Latin-Kanji Host Mixed'; name:'ofs100213AB'),
    (id:$100213B8; codepoint_size:1; max_codepoints:2; charsets:($0081, $0000, $0000, $0000, $0000); desc:'IBM-5048 (CCSID 05048); Japanese Kanji characters; superset of JIS X0208:1990 (and 1983)'; name:'ofs100213B8'),
    (id:$100213B9; codepoint_size:1; max_codepoints:2; charsets:($0082, $0000, $0000, $0000, $0000); desc:'IBM-5049 (CCSID 05049); Japanese Kanji characters; superset of JIS X0212:1990'; name:'ofs100213B9'),
    (id:$100213CB; codepoint_size:1; max_codepoints:2; charsets:($0100, $0000, $0000, $0000, $0000); desc:'IBM-5067 (CCSID 05067); Korean Hangul and Hanja; superset of KS C5601:1987'; name:'ofs100213CB'),
    (id:$100221A4; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'IBM-420 (CCSID 08612); Arabic (base shapes only)'; name:'ofs100221A4'),
    (id:$10022341; codepoint_size:1; max_codepoints:1; charsets:($0001, $0000, $0000, $0000, $0000); desc:'IBM-833 (CCSID 09025); Korean Host SBCS'; name:'ofs10022341'),
    (id:$10022342; codepoint_size:1; max_codepoints:2; charsets:($0100, $0000, $0000, $0000, $0000); desc:'IBM-834 (CCSID 09026); Korean Host DBCS incl 1880 UDC'; name:'ofs10022342'),
    (id:$00000000; codepoint_size:1; max_codepoints:0; charsets:($0000, $0000, $0000, $0000, $0000); desc:'IBM-838 (CCSID 09030); Thai Host Extended SBCS'; name:'ofs00000000'),
    (id:$10022360; codepoint_size:1; max_codepoints:1; charsets:($0016, $0000, $0000, $0000, $0000); desc:'IBM-864 (CCSID 09056); Arabic PC Data (unshaped)'; name:'ofs10022360'),
    (id:$00000000; codepoint_size:1; max_codepoints:0; charsets:($0000, $0000, $0000, $0000, $0000); desc:'IBM-874 (CCSID 09066); Thai PC Display Extended SBCS'; name:'ofs00000000'),
    (id:$100223A5; codepoint_size:1; max_codepoints:2; charsets:($0001, $0100, $0000, $0000, $0000); desc:'IBM-9125 (CCSID 09125); Korean Host Mixed incl 1880 UDC'; name:'ofs100223A5'),
    (id:$10026352; codepoint_size:1; max_codepoints:1; charsets:($0011, $0000, $0000, $0000, $0000); desc:'IBM-850 (CCSID 25426); Multilingual IBM PC Display-MLP'; name:'ofs10026352'),
    (id:$10026358; codepoint_size:1; max_codepoints:1; charsets:($0018, $0000, $0000, $0000, $0000); desc:'IBM-856 (CCSID 25432); Hebrew PC Display (extensions)'; name:'ofs10026358'),
    (id:$10026412; codepoint_size:1; max_codepoints:1; charsets:($0001, $0000, $0000, $0000, $0000); desc:'IBM-1042 (CCSID 25618); S-Ch PC Display Ext SBCS'; name:'ofs10026412'),
    (id:$00000000; codepoint_size:1; max_codepoints:0; charsets:($0000, $0000, $0000, $0000, $0000); desc:'IBM-037 (CCSID 28709); T-Ch Host Extended SBCS'; name:'ofs00000000'),
    (id:$10028358; codepoint_size:1; max_codepoints:1; charsets:($0018, $0000, $0000, $0000, $0000); desc:'IBM-856 (CCSID 33624); Hebrew PC Display'; name:'ofs10028358'),
    (id:$100283BA; codepoint_size:1; max_codepoints:3; charsets:($0080, $0081, $0082, $0000, $0000); desc:'IBM33722 (CCSID 33722); Japanese EUC JISx201,208,212'; name:'ofs100283BA'),
    (id:$10030001; codepoint_size:1; max_codepoints:2; charsets:($0001, $0080, $0081, $0000, $0000); desc:'HTCsjis : Hitachi SJIS 90-1'; name:'ofs10030001'),
    (id:$10030002; codepoint_size:1; max_codepoints:2; charsets:($0001, $0080, $0081, $0000, $0000); desc:'HTCujis : Hitachi eucJP 90-1'; name:'ofs10030002'),
    (id:$FFFF0001; codepoint_size:1; max_codepoints:1; charsets:($0001, $0000, $0000, $0000, $0000); desc:'ASCII7'; name:'ofsFFFF0001'),
    (id:$FFFF0002; codepoint_size:1; max_codepoints:1; charsets:($0001, $0000, $0000, $0000, $0000); desc:'EBCDIC'; name:'ofsFFFF0002'),
    (id:$FFFF0003; codepoint_size:1; max_codepoints:10; charsets:($0011, $0000, $0000, $0000, $0000); desc:'HTML3'; name:'ofsFFFF0003'),
    (id:$FFFF0004; codepoint_size:1; max_codepoints:1; charsets:($0001, $0000, $0000, $0000, $0000); desc:'MACINTOSH'; name:'ofsFFFF0004'),
    (id:$FFFF0005; codepoint_size:1; max_codepoints:1; charsets:($0001, $0000, $0000, $0000, $0000); desc:'Windows 3.1 Latin 1'; name:'ofsFFFF0005'),
    (id:$FFFF0006; codepoint_size:1; max_codepoints:1; charsets:($0015, $0000, $0000, $0000, $0000); desc:'KOI8-R'; name:'ofsFFFF0006'),
    (id:$FFFF0007; codepoint_size:1; max_codepoints:5; charsets:($1000, $0000, $0000, $0000, $0000); desc:'UTF-7; UCS Transformation Format 7 (UTF-7)'; name:'ofsFFFF0007')
  );

implementation

end.

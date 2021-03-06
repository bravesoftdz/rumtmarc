// **********************************************************************
//
// Generated by the ORBacus IDL-to-C++ Translator
//
// Copyright (c) 1999
// Object Oriented Concepts, Inc.
// Billerica, MA, USA
//
// All Rights Reserved
//
// **********************************************************************

// Version: 4.0b2
// License: non-commercial

#include <OB/CORBAServer.h>
#include "calendar_skel.h"

#ifndef OB_INTEGER_VERSION
#   error No ORBacus version defined!
#endif

#ifndef OB_NO_VERSION_CHECK
#   if (OB_INTEGER_VERSION != 3999952L)
#       error ORBacus version mismatch!
#   endif
#endif

//
// IDL:Calendar/insert:1.0
//
OB::DispatchStatus
POA_Calendar::_OB_op_insert(OB::Upcall_ptr _ob_up)
{
    OB::InputStream_ptr _ob_in = _ob_up -> input_nodup();
    date_var _ob_a0;
    date::_OB_unmarshal(_ob_a0.out(), _ob_in);
    OB::StrForStruct _ob_a1;
    _ob_a1 = _ob_in -> read_string();
    _ob_up -> request();

    insert(_ob_a0, _ob_a1);
    _ob_up -> beginReply();
    return OB::DispatchStatusOK;
}

//
// IDL:Calendar/find_date:1.0
//
OB::DispatchStatus
POA_Calendar::_OB_op_find_date(OB::Upcall_ptr _ob_up)
{
    OB::InputStream_ptr _ob_in = _ob_up -> input_nodup();
    date_var _ob_a0;
    date::_OB_unmarshal(_ob_a0.out(), _ob_in);
    CORBA::String_var _ob_a1;
    _ob_up -> request();

    CORBA::Boolean _ob_r = find_date(_ob_a0, _ob_a1.out());
    _ob_up -> beginReply();
    OB::OutputStream_ptr _ob_out = _ob_up -> output_nodup();
    _ob_out -> write_boolean(_ob_r);
    _ob_out -> write_string(_ob_a1.in());
    return OB::DispatchStatusOK;
}

//
// IDL:Calendar/find_note:1.0
//
OB::DispatchStatus
POA_Calendar::_OB_op_find_note(OB::Upcall_ptr _ob_up)
{
    OB::InputStream_ptr _ob_in = _ob_up -> input_nodup();
    OB::StrForStruct _ob_a0;
    _ob_a0 = _ob_in -> read_string();
    date_var _ob_a1;
    _ob_up -> request();

    CORBA::Boolean _ob_r = find_note(_ob_a0, _ob_a1.out());
    _ob_up -> beginReply();
    OB::OutputStream_ptr _ob_out = _ob_up -> output_nodup();
    _ob_out -> write_boolean(_ob_r);
    date::_OB_marshal(_ob_a1.in(), _ob_out);
    return OB::DispatchStatusOK;
}

//
// IDL:Calendar:1.0
//
CORBA::Boolean
POA_Calendar::_is_a(const char* type)
    throw(CORBA::SystemException)
{
    const char** _ob_ids = Calendar::_OB_staticIds();
    for(CORBA::ULong _ob_i = 0 ; _ob_ids[_ob_i] != 0 ; _ob_i++)
        if(strcmp(type, _ob_ids[_ob_i]) == 0)
            return true;

    return false;
}

CORBA::RepositoryId
POA_Calendar::_primary_interface(const PortableServer::ObjectId&,
                                 PortableServer::POA_ptr)
{
    return CORBA::string_dup(Calendar::_OB_staticIds()[0]);
}

Calendar_ptr
POA_Calendar::_this()
{
    CORBA::Object_var obj = _OB_createReference();
    Calendar_var result = Calendar::_narrow(obj);
    return result._retn();
}

bool
POA_Calendar::_OB_hasInterceptors()
{
    return true;
}

OB::DirectStubImpl_ptr
POA_Calendar::_OB_createDirectStubImpl(PortableServer::POA_ptr poa,
                                       const PortableServer::ObjectId& oid)
{
    return new OBDirectStubImpl_Calendar(poa, oid, this);
}

OB::DispatchStatus
POA_Calendar::_OB_dispatch(OB::Upcall_ptr _ob_up)
{
    const char* _ob_op = _ob_up -> operation();

    static const char* _ob_names[] =
    {
        "find_date",
        "find_note",
        "insert"
    };
    static const CORBA::ULong _ob_numNames = 3;

    switch(_OB_findOperation(_ob_op, _ob_names, _ob_numNames))
    {
    case 0: // find_date
        return _OB_op_find_date(_ob_up);

    case 1: // find_note
        return _OB_op_find_note(_ob_up);

    case 2: // insert
        return _OB_op_insert(_ob_up);
    }

    return _OB_dispatchBase(_ob_up);
}

//
// IDL:Calendar:1.0
//
OBDirectStubImpl_Calendar::OBDirectStubImpl_Calendar(PortableServer::POA_ptr poa,
                                                     const PortableServer::ObjectId& oid,
                                                     POA_Calendar* servant)
#ifdef HAVE_VCPLUSPLUS_BUGS
{
    initialize(poa, oid, servant);

    _ob_servant_Calendar_ = servant;
}
#else
    : OB::DirectStubImpl(poa, oid, servant),
      _ob_servant_Calendar_(servant)
{
}
#endif

//
// IDL:Calendar/insert:1.0
//
void
OBDirectStubImpl_Calendar::insert(date* _ob_a0,
                                  const char* _ob_a1)
{
    OB::InvocationHandler _ob_handler(this, "insert");
    date_var _ob_v0;
    if(_ob_a0 != 0)
        _ob_v0 = date::_downcast(_ob_a0 -> _copy_value());
    _ob_servant_Calendar_ -> insert(_ob_v0, _ob_a1);
}

//
// IDL:Calendar/find_date:1.0
//
CORBA::Boolean
OBDirectStubImpl_Calendar::find_date(date* _ob_a0,
                                     CORBA::String_out _ob_a1)
{
    OB::InvocationHandler _ob_handler(this, "find_date");
    date_var _ob_v0;
    if(_ob_a0 != 0)
        _ob_v0 = date::_downcast(_ob_a0 -> _copy_value());
    return _ob_servant_Calendar_ -> find_date(_ob_v0, _ob_a1);
}

//
// IDL:Calendar/find_note:1.0
//
CORBA::Boolean
OBDirectStubImpl_Calendar::find_note(const char* _ob_a0,
                                     date*& _ob_a1)
{
    OB::InvocationHandler _ob_handler(this, "find_note");
    return _ob_servant_Calendar_ -> find_note(_ob_a0, _ob_a1);
}

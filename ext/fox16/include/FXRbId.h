/***********************************************************************
 * FXRuby -- the Ruby language bindings for the FOX GUI toolkit.
 * Copyright (c) 2001-2009 by Lyle Johnson. All Rights Reserved.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 * For further information please contact the author by e-mail
 * at "lyle@lylejohnson.name".
 ***********************************************************************/

/***********************************************************************
 * $Id: FXRbId.h 2190 2005-08-24 07:58:47Z lyle $
 ***********************************************************************/

#ifndef FXRBID_H
#define FXRBID_H

#define DECLARE_FXID_STUBS(klass) \
inline void klass ## _create(klass* self){ \
  self->klass::create(); \
  } \
inline void klass ## _detach(klass* self){ \
  self->klass::detach(); \
  } \
inline void klass ## _destroy(klass* self){ \
  self->klass::destroy(); \
  }


#define IMPLEMENT_FXID_STUBS(cls) \
  void cls::create(){ \
    FXRbCallVoidMethod(this,rb_intern("create")); \
    } \
  void cls::detach(){ \
    FXRbCallVoidMethod(this,rb_intern("detach")); \
    } \
  void cls::destroy(){ \
    FXRbCallVoidMethod(this,rb_intern("destroy")); \
    }


class FXRbId : public FXId {
  FXDECLARE(FXRbId)
protected:
  FXRbId(){}
#include "FXRbObjectVirtuals.h"
#include "FXRbIdVirtuals.h"
protected:
  // Constructor
  FXRbId(FXApp* a) : FXId(a){}

public:
  // Destructor
  virtual ~FXRbId(){
    FXRbUnregisterRubyObj(this);
    }

  // Mark dependencies for the GC
  static void markfunc(FXId* id);
  };

#endif

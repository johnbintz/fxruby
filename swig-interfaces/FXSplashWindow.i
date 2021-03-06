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

/// Splash Window options
enum {
  SPLASH_SIMPLE    = 0,                 /// Simple rectangular splash window
  SPLASH_SHAPED    = 0x02000000,        /// Shaped splash window
  SPLASH_OWNS_ICON = 0x04000000,        /// Splash window will own the icon and destroy it
  SPLASH_DESTROY   = 0x08000000         /// Splash window will destroy itself when timer expires
  };

%rename("delay")  FXSplashWindow::getDelay() const;
%rename("delay=") FXSplashWindow::setDelay(FXTime);
%rename("icon")   FXSplashWindow::getIcon() const;
%rename("icon=")  FXSplashWindow::setIcon(FXIcon*);

/**
* The Splash Window is a window typically shown during startup
* of an application.  It comprises a large icon, which is also
* used as the shape of the window if SPLASH_SHAPED is passed;
* with the SPLASH_SIMPLE option the window will be simply rectangular.
*/
class FXSplashWindow : public FXTopWindow {
protected:
  FXIcon *icon;         // Really big icon
  FXTime  delay;        // Delay before hiding
protected:
  FXSplashWindow();
private:
  FXSplashWindow(const FXSplashWindow&);
  FXSplashWindow &operator=(const FXSplashWindow&);
public:
  long onPaint(FXObject*,FXSelector,void* PTR_EVENT);
public:

  /**
   * Construct splash window; the window will be automatically hidden (or deleted
   * if SPLASH_DESTROY is passed) after a given delay, specified in nanoseconds).
   * The splash window is free floating.  Use this constructor when the splash window
   * is to be displayed before the main window appears.
   */
  FXSplashWindow(FXApp* ap,FXIcon* ic,FXuint opts=SPLASH_SIMPLE,FXTime ns=2000000000){
    return new FXRbSplashWindow(ap,ic,opts,ns);
    }

  /**
   * Construct splash window; the window will be automatically hidden (or deleted
   * if SPLASH_DESTROY is passed) after a given delay, specified in nanoseconds).
   * The splash window stays on top of its owner window, which must already have been
   * created previously.
   */
  FXSplashWindow(FXWindow* ow,FXIcon* ic,FXuint opts=SPLASH_SIMPLE,FXTime ns=2000000000){
    return new FXRbSplashWindow(ow,ic,opts,ns);
    }

  /// Set the icon for the splash window
  void setIcon(FXIcon* ic);

  /// Get the icon for this splash window
  FXIcon* getIcon() const;

  /// Set or change delay in nanoseconds
  void setDelay(FXTime ns);

  /// Return delay
  FXTime getDelay() const;

  /// Destroy splash window
  virtual ~FXSplashWindow();
  };

DECLARE_FXOBJECT_VIRTUALS(FXSplashWindow)
DECLARE_FXID_VIRTUALS(FXSplashWindow)
DECLARE_FXDRAWABLE_VIRTUALS(FXSplashWindow)
DECLARE_FXWINDOW_VIRTUALS(FXSplashWindow)
DECLARE_FXTOPWINDOW_VIRTUALS(FXSplashWindow)


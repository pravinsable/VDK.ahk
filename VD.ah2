class VD {
  static dummyStatic1 := this._init()

  static init() {
    ;will trigger dummyStatic1
  }

  static _init() {
    if (this.hasOwnProp("_dll_GetCurrentDesktop")) {
      return
    }
    splitByDot := StrSplit(A_OSVersion, ".")
    buildNumber := splitByDot[3]
    if (buildNumber < 22000) {
      IID_IVirtualDesktopManagerInternal_ := "{F31574D6-B682-4CDC-BD56-1827860ABEC6}"
      IID_IVirtualDesktop_ := "{FF72FFDD-BE7E-43FC-9C03-AD81681E88E4}"
      this._dll_GetCurrentDesktop := this._dll_GetCurrentDesktop_Win_Default
      this._dll_GetDesktops := this._dll_GetDesktops_Win_Default
      this._dll_CreateDesktop := this._dll_CreateDesktop_Win_Default
      this._dll_GetName := this._dll_GetName_Win10
      this.RegisterDesktopNotifications := this.RegisterDesktopNotifications_Win10
    } else if (buildNumber < 22621) {
      IID_IVirtualDesktopManagerInternal_ := "{B2F925B9-5A0F-4D2E-9F4D-2B1507593C10}"
      IID_IVirtualDesktop_ := "{536D3495-B208-4CC9-AE26-DE8111275BF8}"
      this._dll_GetCurrentDesktop := this._dll_GetCurrentDesktop_Win11
      this._dll_GetDesktops := this._dll_GetDesktops_Win11
      this._dll_CreateDesktop := this._dll_CreateDesktop_Win11
      this._dll_GetName := this._dll_GetName_Win11
      this.RegisterDesktopNotifications := this.RegisterDesktopNotifications_Win11
    } else if (buildNumber < 22631) {
      ; https://github.com/FuPeiJiang/VD.ahk/compare/v2_port...mac-s-g:VD.ahk:v2_port
      ; Win11 after breaking changes made at build 22621.2215
      IID_IVirtualDesktopManagerInternal_ := "{A3175F2D-239C-4BD2-8AA0-EEBA8B0B138E}"
      IID_IVirtualDesktop_ := "{3F07F4BE-B107-441A-AF0F-39D82529072C}"
      this._dll_GetDesktops := this._dll_GetDesktops_Win_Default
      this._dll_GetCurrentDesktop := this._dll_GetCurrentDesktop_Win_Default
      this._dll_CreateDesktop := this._dll_CreateDesktop_Win_Default
      this._dll_GetName := this._dll_GetName_Win11
      this.RegisterDesktopNotifications := this.RegisterDesktopNotifications_Win11
    } else {
      ; https://github.com/FuPeiJiang/VD.ahk/commit/1d9a94ef8ef87a4fc6d2cb5f83b6d068302a03d9
      IID_IVirtualDesktopManagerInternal_ := "{4970BA3D-FD4E-4647-BEA3-D89076EF4B9C}"
      IID_IVirtualDesktop_ := "{3F07F4BE-B107-441A-AF0F-39D82529072C}"
      this._dll_GetDesktops := this._dll_GetDesktops_Win_Default
      this._dll_GetCurrentDesktop := this._dll_GetCurrentDesktop_Win_Default
      this._dll_CreateDesktop := this._dll_CreateDesktop_Win_Default
      this._dll_GetName := this._dll_GetName_Win11
      this.RegisterDesktopNotifications := this.RegisterDesktopNotifications_Win11
    }
    this.IVirtualDesktopManager := ComObject("{AA509086-5CA9-4C25-8F95-589D3C07B48A}", "{A5CD92FF-29BE-454C-8D04-D82879FB3F1B}")
    this.GetWindowDesktopId := this._vtable(this.IVirtualDesktopManager.Ptr, 4)
    this.MoveWindowToDesktop := this._vtable(this.IVirtualDesktopManager.Ptr, 5)
    this.IServiceProvider := ComObject("{C2F03A33-21F5-47FA-B4BB-156362A2F239}", "{6D5140C1-7436-11CE-8034-00AA006009FA}")
    this.IVirtualDesktopManagerInternal := ComObjQuery(this.IServiceProvider.Ptr, "{C5E0CDCA-7B6E-41B2-9FC4-D93975CC467B}", IID_IVirtualDesktopManagerInternal_)
    this.MoveViewToDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 4)
    this.CanViewMoveDesktops := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 5)
    this.GetCurrentDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 6)
    if (buildNumber < 22000) {
      this.GetDesktops := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 7)
      this.Ptr_CreateDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 10)
      this.Ptr_RemoveDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 11)
      this.FindDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 12)
    } else if (buildNumber < 22489) {
      this.GetDesktops := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 7)
      this.Ptr_CreateDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 10)
      this.Ptr_RemoveDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 12)
      this.FindDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 13)
    } else if (buildNumber < 22621) {
      this.GetDesktops := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 8)
      this.Ptr_CreateDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 11)
      this.Ptr_RemoveDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 13)
      this.FindDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 14)
    } else {
      ; Win11 after breaking changes made at build 22621.2215 
      this.GetDesktops := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 7)
      this.Ptr_CreateDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 10)
      this.Ptr_RemoveDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 12)
      this.FindDesktop := this._vtable(this.IVirtualDesktopManagerInternal.Ptr, 13)
    }
    this.IVirtualDesktopPinnedApps := ComObjQuery(this.IServiceProvider.Ptr, "{B5A399E7-1C87-46B8-88E9-FC5747B171BD}", "{4CE81583-1E4C-4632-A621-07A53543148F}")
    this.IsViewPinned := this._vtable(this.IVirtualDesktopPinnedApps.Ptr, 6)
    this.PinView := this._vtable(this.IVirtualDesktopPinnedApps.Ptr, 7)
    this.UnpinView := this._vtable(this.IVirtualDesktopPinnedApps.Ptr, 8)
    ImmersiveShell := ComObject("{C2F03A33-21F5-47FA-B4BB-156362A2F239}", "{00000000-0000-0000-C000-000000000046}")
    this.IApplicationViewCollection := ComObjQuery(ImmersiveShell.Ptr, "{1841C6D7-4F9D-42C0-AF41-8747538F10E5}", "{1841C6D7-4F9D-42C0-AF41-8747538F10E5}")
    if (!this.IApplicationViewCollection.Ptr) {
      MsgBox "IApplicationViewCollection interface not supported."
    }
    this.GetViewForHwnd := this._vtable(this.IApplicationViewCollection.Ptr, 6)
    this.Ptr_IID_IVirtualDesktop := DllCall("GlobalAlloc", "UInt", 0x00, "UInt", 16, "Ptr")
    DllCall("Ole32.dll\CLSIDFromString", "Str", IID_IVirtualDesktop_, "Ptr", this.Ptr_IID_IVirtualDesktop)
    this.savedLocalizedWord_Desktop := false
  }
  static _dll_GetCurrentDesktop_Win_Default() {
    IVirtualDesktop_ofCurrentDesktop := 0
    DllCall(this.GetCurrentDesktop, "UPtr", this.IVirtualDesktopManagerInternal.Ptr, "Ptr*", &IVirtualDesktop_ofCurrentDesktop := 0)
    return IVirtualDesktop_ofCurrentDesktop
  }
  static _dll_GetCurrentDesktop_Win11() {
    IVirtualDesktop_ofCurrentDesktop := 0
    DllCall(this.GetCurrentDesktop, "UPtr", this.IVirtualDesktopManagerInternal.Ptr, "Ptr", 0, "Ptr*", &IVirtualDesktop_ofCurrentDesktop := 0)
    return IVirtualDesktop_ofCurrentDesktop
  }
  static _dll_GetDesktops_Win_Default() {
    IObjectArray := 0
    DllCall(this.GetDesktops, "UPtr", this.IVirtualDesktopManagerInternal.Ptr, "Ptr*", &IObjectArray := 0)
    return IObjectArray
  }
  static _dll_GetDesktops_Win11() {
    IObjectArray := 0
    DllCall(this.GetDesktops, "UPtr", this.IVirtualDesktopManagerInternal.Ptr, "Ptr", 0, "UPtr*", &IObjectArray := 0)
    return IObjectArray
  }
  static _dll_CreateDesktop_Win_Default() {
    IVirtualDesktop_ofNewDesktop := 0
    DllCall(this.Ptr_CreateDesktop, "UPtr", this.IVirtualDesktopManagerInternal.Ptr, "Ptr*", &IVirtualDesktop_ofNewDesktop := 0)
    return IVirtualDesktop_ofNewDesktop
  }
  static _dll_CreateDesktop_Win11() {
    IVirtualDesktop_ofNewDesktop := 0
    DllCall(this.Ptr_CreateDesktop, "UPtr", this.IVirtualDesktopManagerInternal.Ptr, "Ptr", 0, "Ptr*", &IVirtualDesktop_ofNewDesktop := 0)
    return IVirtualDesktop_ofNewDesktop
  }
  static _dll_GetName_Win10(IVirtualDesktop) {
    QueryInterface := this._vtable(IVirtualDesktop, 0)
    CLSID := Buffer(16)
    DllCall("Ole32.dll\CLSIDFromString", "Str", "{31EBDE3F-6EC3-4CBD-B9FB-0EF6D09B41F4}", "Ptr", CLSID)
    DllCall(QueryInterface, "UPtr", IVirtualDesktop, "Ptr", CLSID, "Ptr*", &IVirtualDesktop2 := 0)
    GetName := this._vtable(IVirtualDesktop2, 5)
    DllCall(GetName, "UPtr", IVirtualDesktop2, "Ptr*", &Handle_DesktopName := 0)
    if (Handle_DesktopName == 0) {
      return ""
    }
    Ptr_DesktopName := DllCall("combase\WindowsGetStringRawBuffer", "Ptr", Handle_DesktopName, "UInt*", &length := 0, "Ptr")
    desktopName := StrGet(Ptr_DesktopName + 0, "UTF-16")
    return desktopName
  }
  static _dll_GetName_Win11(IVirtualDesktop) {
    GetName := this._vtable(IVirtualDesktop, 6)
    DllCall(GetName, "UPtr", IVirtualDesktop, "Ptr*", &Handle_DesktopName := 0)
    if (Handle_DesktopName == 0) {
      return ""
    }
    Ptr_DesktopName := DllCall("combase\WindowsGetStringRawBuffer", "Ptr", Handle_DesktopName, "UInt*", &length := 0, "Ptr")
    desktopName := StrGet(Ptr_DesktopName + 0, "UTF-16")
    return desktopName
  }
  static getCount() {
    return this._GetDesktops_Obj().GetCount()
  }
  static goToDesktopNum(desktopNum) {
    firstWindowId := this._getFirstWindowInVD(desktopNum)
    VD_animation_gui := Gui("-Border -SysMenu +Owner -Caption")
    VD_animation_gui_hwnd := VD_animation_gui.Hwnd + 0
    IVirtualDesktop := this._GetDesktops_Obj().GetAt(desktopNum)
    GetId := this._vtable(IVirtualDesktop, 4)
    GUID_Desktop := Buffer(16)
    DllCall(GetId, "Ptr", IVirtualDesktop, "Ptr", GUID_Desktop)
    DllCall(this.MoveWindowToDesktop, "Ptr", this.IVirtualDesktopManager.Ptr, "Ptr", VD_animation_gui_hwnd, "Ptr", GUID_Desktop)
    DllCall("ShowWindow", "Ptr", VD_animation_gui_hwnd, "Int", 4)
    this._WinActivate_NewProcess(VD_animation_gui_hwnd)
    loop 20 {
      if (this.getCurrentDesktopNum() == desktopNum) {
        if (firstWindowId) {
          DllCall("SetForegroundWindow", "Ptr", firstWindowId)
        } else {
          this._activateDesktopBackground()
        }
        break
      }
      Sleep 25
    }
    VD_animation_gui.Destroy()
  }
  static _getLocalizedWord_Desktop() {
    if (this.savedLocalizedWord_Desktop) {
      return this.savedLocalizedWord_Desktop
    }
    hModule := DllCall("GetModuleHandle", "Str", "shell32.dll", "Ptr")
    length := DllCall("LoadString", "Uint", hModule, "Uint", 21769, "Ptr*", &lpBuffer := 0, "Int", 0)
    this.savedLocalizedWord_Desktop := StrGet(lpBuffer, length, "UTF-16")
    return this.savedLocalizedWord_Desktop
  }
  static getNameFromDesktopNum(desktopNum) {
    IVirtualDesktop := this._GetDesktops_Obj().GetAt(desktopNum)
    _name := this._dll_GetName(IVirtualDesktop)
    if (!_name) {
      _name := this._getLocalizedWord_Desktop() " " desktopNum
    }
    return _name
  }
  static getDesktopNumOfWindow(wintitle) {
    found := this._tryGetValidWindow(wintitle)
    if (!found) {
      return -1
    }
    theHwnd := found[1]
    desktopNum_ofWindow := this._desktopNum_from_Hwnd(theHwnd)
    return desktopNum_ofWindow
  }
  static goToDesktopOfWindow(wintitle, activateYourWindow := true) {
    found := this._tryGetValidWindow(wintitle)
    if (!found) {
      return -1
    }
    theHwnd := found[1]
    desktopNum_ofWindow := this._desktopNum_from_Hwnd(theHwnd)
    this.goToDesktopNum(desktopNum_ofWindow)
    if (activateYourWindow) {
      WinActivate "ahk_id " theHwnd
    }
  }
  static MoveWindowToDesktopNum(wintitle, desktopNum) {
    found := this._tryGetValidWindow(wintitle)
    if (!found) {
      return -1
    }
    theHwnd := found[1]
    thePView := found[2]
    needActivateWindowUnder := false
    if (activeHwnd := WinExist("A")) {
      if (activeHwnd == theHwnd) {
        currentDesktopNum := this.getCurrentDesktopNum()
        if (!(currentDesktopNum == desktopNum)) {
          needActivateWindowUnder := true
        }
      }
    }
    IVirtualDesktop := this._GetDesktops_Obj().GetAt(desktopNum)
    DllCall(this.MoveViewToDesktop, "ptr", this.IVirtualDesktopManagerInternal.Ptr, "Ptr", thePView, "Ptr", IVirtualDesktop)
    if (needActivateWindowUnder) {
      firstWindowId := this._getFirstWindowInVD(currentDesktopNum, theHwnd)
      if (firstWindowId) {
        VD._WinActivate_NewProcess(firstWindowId)
      } else {
        this._activateDesktopBackground()
      }
    }
  }
  static getRelativeDesktopNum(anchor_desktopNum, relative_count) {
    Desktops_Obj := this._GetDesktops_Obj()
    count_Desktops := Desktops_Obj.GetCount()
    absolute_desktopNum := anchor_desktopNum + relative_count
    absolute_desktopNum := Mod(absolute_desktopNum, count_Desktops)
    if (absolute_desktopNum <= 0) {
      absolute_desktopNum := absolute_desktopNum + count_Desktops
    }
    return absolute_desktopNum
  }
  static MoveWindowToRelativeDesktopNum(wintitle, relative_count) {
    desktopNum_ofWindow := this.getDesktopNumOfWindow(wintitle)
    absolute_desktopNum := this.getRelativeDesktopNum(desktopNum_ofWindow, relative_count)
    this.MoveWindowToDesktopNum(wintitle, absolute_desktopNum)
    return absolute_desktopNum
  }
  static gotoRelativeDesktopNum(relative_count) {
    this.goToDesktopNum(this.getRelativeDesktopNum(this.getCurrentDesktopNum(), relative_count))
  }
  static MoveWindowToCurrentDesktop(wintitle, activateYourWindow := true) {
    found := this._tryGetValidWindow(wintitle)
    if (!found) {
      return -1
    }
    theHwnd := found[1]
    thePView := found[2]
    currentDesktopNum := this.getCurrentDesktopNum()
    IVirtualDesktop := this._GetDesktops_Obj().GetAt(currentDesktopNum)
    DllCall(this.MoveViewToDesktop, "ptr", this.IVirtualDesktopManagerInternal.Ptr, "Ptr", thePView, "Ptr", IVirtualDesktop)
    if (activateYourWindow) {
      WinActivate "ahk_id " theHwnd
    }
  }
  static getCurrentDesktopNum() {
    IVirtualDesktop_ofCurrentDesktop := this._dll_GetCurrentDesktop()
    desktopNum := this._desktopNum_from_IVirtualDesktop(IVirtualDesktop_ofCurrentDesktop)
    return desktopNum
  }
  static createDesktop(goThere := false) {
    IVirtualDesktop_ofNewDesktop := this._dll_CreateDesktop()
    if (goThere) {
      desktopNum := this._desktopNum_from_IVirtualDesktop(IVirtualDesktop_ofNewDesktop)
      this.goToDesktopNum(desktopNum)
    }
  }
  static createUntil(howMany, goToLastlyCreated := false) {
    howManyThereAlreadyAre := this.getCount()
    if (howManyThereAlreadyAre >= howMany) {
      return
    }
    loop howMany - howManyThereAlreadyAre - 1 {
      this.createDesktop(false)
    }
    this.createDesktop(goToLastlyCreated)
  }
  static removeDesktop(desktopNum, fallback_desktopNum := false) {
    Desktops_Obj := this._GetDesktops_Obj()
    if (!fallback_desktopNum) {
      if (desktopNum > 1) {
        fallback_desktopNum := desktopNum - 1
      } else if (desktopNum < Desktops_Obj.GetCount()) {
        fallback_desktopNum := desktopNum + 1
      } else {
        return false
      }
    }
    IVirtualDesktop := Desktops_Obj.GetAt(desktopNum)
    IVirtualDesktop_fallback := Desktops_Obj.GetAt(fallback_desktopNum)
    DllCall(this.Ptr_RemoveDesktop, "UPtr", this.IVirtualDesktopManagerInternal.Ptr, "Ptr", IVirtualDesktop, "Ptr", IVirtualDesktop_fallback)
  }
  static IsWindowPinned(wintitle) {
    found := this._tryGetValidWindow(wintitle)
    if (!found) {
      return -1
    }
    thePView := found[2]
    viewIsPinned := this._IsViewPinned(thePView)
    return viewIsPinned
  }
  static TogglePinWindow(wintitle) {
    found := this._tryGetValidWindow(wintitle)
    if (!found) {
      return -1
    }
    thePView := found[2]
    viewIsPinned := this._IsViewPinned(thePView)
    if (viewIsPinned) {
      DllCall(this.UnPinView, "UPtr", this.IVirtualDesktopPinnedApps.Ptr, "Ptr", thePView)
    } else {
      DllCall(this.PinView, "UPtr", this.IVirtualDesktopPinnedApps.Ptr, "Ptr", thePView)
    }
  }
  static PinWindow(wintitle) {
    found := this._tryGetValidWindow(wintitle)
    if (!found) {
      return -1
    }
    thePView := found[2]
    DllCall(this.PinView, "UPtr", this.IVirtualDesktopPinnedApps.Ptr, "Ptr", thePView)
  }
  static UnPinWindow(wintitle) {
    found := this._tryGetValidWindow(wintitle)
    if (!found) {
      return -1
    }
    thePView := found[2]
    DllCall(this.UnPinView, "UPtr", this.IVirtualDesktopPinnedApps.Ptr, "Ptr", thePView)
  }
  static _QueryInterface_Win10(riid, ppvObject) {
    if (!ppvObject) {
      return 0x80070057
    }
    str_IID_IUnknown := "{00000000-0000-0000-C000-000000000046}"
    str_IID_IVirtualDesktopNotification := "{C179334C-4295-40D3-BEA1-C654D965605A}"
    someStr := Buffer(40 * 2)
    DllCall("Ole32\StringFromGUID2", "Ptr", riid, "Ptr", someStr, "Ptr", 40)
    str_riid := StrGet(someStr)
    if (str_riid == str_IID_IUnknown || str_riid == str_IID_IVirtualDesktopNotification) {
      NumPut("Ptr", this, ppvObject + 0, 0)
      VD._AddRef_Same.Call(this)
      return 0
    }
    NumPut("Ptr", 0, ppvObject + 0, 0)
    return 0x80004002
  }
  static _AddRef_Same() {
    refCount := NumGet(this + 0, A_PtrSize, "UInt")
    refCount++
    NumPut("UInt", refCount, this + 0, A_PtrSize)
    return refCount
  }
  static _Release_Same() {
    refCount := NumGet(this + 0, A_PtrSize, "UInt")
    refCount--
    NumPut("UInt", refCount, this + 0, A_PtrSize)
    return refCount
  }
  static _VirtualDesktopCreated_Win10(pDesktop) {
    VD.VirtualDesktopCreated.Call(VD._desktopNum_from_IVirtualDesktop(pDesktop))
    return 0
  }
  static _VirtualDesktopDestroyBegin_Win10(pDesktopDestroyed, pDesktopFallback) {
    VD.VirtualDesktopDestroyBegin.Call(VD._desktopNum_from_IVirtualDesktop(pDesktopDestroyed), VD._desktopNum_from_IVirtualDesktop(pDesktopFallback))
    return 0
  }
  static _VirtualDesktopDestroyFailed_Win10(pDesktopDestroyed, pDesktopFallback) {
    VD.VirtualDesktopDestroyFailed.Call(VD._desktopNum_from_IVirtualDesktop(pDesktopDestroyed), VD._desktopNum_from_IVirtualDesktop(pDesktopFallback))
    return 0
  }
  static _VirtualDesktopDestroyed_Win10(pDesktopDestroyed, pDesktopFallback) {
    VD.VirtualDesktopDestroyed.Call(VD._desktopNum_from_IVirtualDesktop(pDesktopDestroyed), VD._desktopNum_from_IVirtualDesktop(pDesktopFallback))
    return 0
  }
  static _ViewVirtualDesktopChanged_Win10(pView) {
    VD.ViewVirtualDesktopChanged.Call(pView)
    return 0
  }
  static _CurrentVirtualDesktopChanged_Win10(pDesktopOld, pDesktopNew) {
    VD.CurrentVirtualDesktopChanged.Call(VD._desktopNum_from_IVirtualDesktop(pDesktopOld), VD._desktopNum_from_IVirtualDesktop(pDesktopNew))
    return 0
  }
  static RegisterDesktopNotifications_Win10() {
    methods := DllCall("GlobalAlloc", "Uint", 0x00, "Uint", 9 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._QueryInterface_Win10, "F"), methods + 0, 0 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._AddRef_Same, "F"), methods + 0, 1 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._Release_Same, "F"), methods + 0, 2 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._VirtualDesktopCreated_Win10, "F"), methods + 0, 3 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._VirtualDesktopDestroyBegin_Win10, "F"), methods + 0, 4 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._VirtualDesktopDestroyFailed_Win10, "F"), methods + 0, 5 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._VirtualDesktopDestroyed_Win10, "F"), methods + 0, 6 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._ViewVirtualDesktopChanged_Win10, "F"), methods + 0, 7 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._CurrentVirtualDesktopChanged_Win10, "F"), methods + 0, 8 * A_PtrSize)
    this.RegisterDesktopNotifications_Same(methods)
  }
  static _QueryInterface_Win11(riid, ppvObject) {
    splitByDot := StrSplit(A_OSVersion, ".")
    buildNumber := splitByDot[3]

    if (!ppvObject) {
      return 0x80070057
    }
    str_IID_IUnknown := "{00000000-0000-0000-C000-000000000046}"
    if (buildNumber < 22631) {
      str_IID_IVirtualDesktopNotification := "{CD403E52-DEED-4C13-B437-B98380F2B1E8}"
    } else {
      str_IID_IVirtualDesktopNotification := "{B9E5E94D-233E-49AB-AF5C-2B4541C3AADE}"
    }
    someStr := Buffer(40 * 2)
    DllCall("Ole32\StringFromGUID2", "Ptr", riid, "Ptr", someStr, "Ptr", 40)
    str_riid := StrGet(someStr)
    if (str_riid == str_IID_IUnknown || str_riid == str_IID_IVirtualDesktopNotification) {
      NumPut("Ptr", this, ppvObject + 0, 0)
      VD._AddRef_Same.Call(this)
      return 0
    }
    NumPut("Ptr", 0, ppvObject + 0, 0)
    return 0x80004002
  }
  static _VirtualDesktopCreated_Win11(p0, pDesktop) {
    VD.VirtualDesktopCreated.Call(VD._desktopNum_from_IVirtualDesktop(pDesktop))
    return 0
  }
  static _VirtualDesktopDestroyBegin_Win11(p0, pDesktopDestroyed, pDesktopFallback) {
    VD.VirtualDesktopDestroyBegin.Call(VD._desktopNum_from_IVirtualDesktop(pDesktopDestroyed), VD._desktopNum_from_IVirtualDesktop(pDesktopFallback))
    return 0
  }
  static _VirtualDesktopDestroyFailed_Win11(p0, pDesktopDestroyed, pDesktopFallback) {
    VD.VirtualDesktopDestroyFailed.Call(VD._desktopNum_from_IVirtualDesktop(pDesktopDestroyed), VD._desktopNum_from_IVirtualDesktop(pDesktopFallback))
    return 0
  }
  static _VirtualDesktopDestroyed_Win11(p0, pDesktopDestroyed, pDesktopFallback) {
    VD.VirtualDesktopDestroyed.Call(VD._desktopNum_from_IVirtualDesktop(pDesktopDestroyed), VD._desktopNum_from_IVirtualDesktop(pDesktopFallback))
    return 0
  }
  static _ViewVirtualDesktopChanged_Win11(pView) {
    VD.ViewVirtualDesktopChanged.Call(pView)
    return 0
  }
  static _CurrentVirtualDesktopChanged_Win11(p0, pDesktopOld, pDesktopNew) {
    VD.CurrentVirtualDesktopChanged.Call(VD._desktopNum_from_IVirtualDesktop(pDesktopOld), VD._desktopNum_from_IVirtualDesktop(pDesktopNew))
    return 0
  }
  static _No_Op() {
  }
  static RegisterDesktopNotifications_Win11() {
    methods := DllCall("GlobalAlloc", "Uint", 0x00, "Uint", 13 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._QueryInterface_Win11, "F"), methods + 0, 0 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._AddRef_Same, "F"), methods + 0, 1 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._Release_Same, "F"), methods + 0, 2 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._VirtualDesktopCreated_Win11, "F"), methods + 0, 3 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._VirtualDesktopDestroyBegin_Win11, "F"), methods + 0, 4 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._VirtualDesktopDestroyFailed_Win11, "F"), methods + 0, 5 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._VirtualDesktopDestroyed_Win11, "F"), methods + 0, 6 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._No_Op, "F"), methods + 0, 7 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._No_Op, "F"), methods + 0, 8 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._No_Op, "F"), methods + 0, 9 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._ViewVirtualDesktopChanged_Win11, "F"), methods + 0, 10 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._CurrentVirtualDesktopChanged_Win11, "F"), methods + 0, 11 * A_PtrSize)
    NumPut("Ptr", CallbackCreate(VD._No_Op, "F"), methods + 0, 12 * A_PtrSize)
    this.RegisterDesktopNotifications_Same(methods)
  }
  static RegisterDesktopNotifications_Same(methods) {
    obj := DllCall("GlobalAlloc", "Uint", 0x00, "Uint", A_PtrSize + 4)
    NumPut("Ptr", methods, obj + 0, 0)
    NumPut("UInt", 0, obj + 0, A_PtrSize)
    pDesktopNotificationService := ComObjQuery(this.IServiceProvider.Ptr, "{A501FDEC-4A09-464C-AE4E-1B9C21B84918}", "{0CD45E71-D927-4F15-8B0A-8FEF525337BF}")
    Register := this._vtable(pDesktopNotificationService.Ptr, 3)
    HRESULT := DllCall(Register, "UPtr", pDesktopNotificationService.Ptr, "Ptr", obj, "Uint*", &pdwCookie := 0)
  }
  static VirtualDesktopCreated(desktopNum := 0) {
  }
  static VirtualDesktopDestroyBegin(desktopNum_Destroyed := 0, desktopNum_Fallback := 0) {
  }
  static VirtualDesktopDestroyFailed(desktopNum_Destroyed := 0, desktopNum_Fallback := 0) {
  }
  static VirtualDesktopDestroyed(desktopNum_Destroyed := 0, desktopNum_Fallback := 0) {
  }
  static ViewVirtualDesktopChanged(pView := 0) {
  }
  static CurrentVirtualDesktopChanged(desktopNum_Old := 0, desktopNum_New := 0) {
  }
  static startShellMessage() {
    DllCall("RegisterShellHookWindow", "Ptr", A_ScriptHwnd)
    MsgNum := DllCall("RegisterWindowMessage", "Str", "SHELLHOOK")
    OnMessage(MsgNum, VD.ShellMessage.bind(this))
    this.map_title_class := Map()
  }
  static Run(Target, WorkingDir, this_titleName, this_class, this_processName, desktopNum) {
    this.addToWaitNewWindow(this_titleName, this_class, this_processName, VD.callback_MoveWindow.bind(this, desktopNum))
    Run Target, WorkingDir
  }
  static Run_lock_VD(Target, WorkingDir, this_titleName, this_class, this_processName, window_desktopNum, your_desktopNum) {
    this.addToWaitNewWindow(this_titleName, this_class, this_processName, VD.callback_MoveWindow_lockVD.bind(this, [window_desktopNum, your_desktopNum]))
    Run Target, WorkingDir
  }
  static addToWaitNewWindow(this_titleName, this_class, this_processName, callback) {
    map_class_processName := this.map_title_class.Has(this_titleName) ? this.map_title_class[this_titleName] : this.map_title_class[this_titleName] := Map()
    map_processName_data := map_class_processName.Has(this_class) ? map_class_processName[this_class] : map_class_processName[this_class] := Map()
    arrOfCallback := map_processName_data.Has(this_processName) ? map_processName_data[this_processName] : map_processName_data[this_processName] := []
    arrOfCallback.Push(callback)
  }
  static callback_MoveWindow(desktopNum, hwnd) {
    WinActivate "ahk_id " hwnd
    this.MoveWindowToDesktopNum("ahk_id " hwnd, desktopNum)
  }
  static callback_MoveWindow_lockVD(tuple, hwnd) {
    window_desktopNum := tuple[1]
    your_desktopNum := tuple[2]
    WinActivate "ahk_id " hwnd
    this.goToDesktopNum(your_desktopNum)
    WinActivate "ahk_id " hwnd
    this.MoveWindowToDesktopNum("ahk_id " hwnd, window_desktopNum)
    WinActivate "ahk_id " hwnd
  }
  static ShellMessage(wParam, lParam, msg, hwnd) {
    Critical
    Sleep 100
    if (wParam == 1) {
      theHwnd := lParam
      bak_DetectHiddenWindows := A_DetectHiddenWindows
      DetectHiddenWindows true
      arrOfCallback := false
      outside_map_processName_data := false
      outside_map_class_processName := false
      outside_subString_title := false
      this_title := WinGetTitle("ahk_id " theHwnd)
      for subString_title, map_class_processName in this.map_title_class {
        if ((subString_title == "" || InStr(this_title, subString_title, true))) {
          this_class := WinGetClass("ahk_id " theHwnd)
          for subString_class, map_processName_data in map_class_processName {
            if ((subString_class == "" || InStr(this_class, subString_class, true))) {
              this_processName := WinGetProcessName("ahk_id " theHwnd)
              for subString_processName, possibly_arrOfCallback in map_processName_data {
                if ((subString_processName == "" || InStr(this_processName, subString_processName, true))) {
                  arrOfCallback := possibly_arrOfCallback
                  outside_map_processName_data := map_processName_data
                  outside_map_class_processName := map_class_processName
                  outside_subString_title := subString_title
                  break
                }
              }
              break
            }
          }
          break
        }
      }
      DetectHiddenWindows bak_DetectHiddenWindows
      if (arrOfCallback) {
        callback := arrOfCallback[1]
        callback.Call(theHwnd)
        if (arrOfCallback.Length > 1) {
          arrOfCallback.RemoveAt(1)
        } else if ((Type(temp := outside_map_processName_data) == "Array" ? temp.Length : temp.Count) > 1) {
          outside_map_processName_data.Delete(subString_processName)
        } else if ((Type(temp2 := outside_map_class_processName) == "Array" ? temp2.Length : temp2.Count) > 1) {
          outside_map_class_processName.Delete(subString_class)
        } else {
          this.map_title_class.Delete(outside_subString_title)
        }
      }
    }
  }
  static _WinActivate_NewProcess(hWnd) {
    foregroundWindow := DllCall("GetForegroundWindow", "Ptr")
    threadID := DllCall("GetWindowThreadProcessId", "Ptr", foregroundWindow, "Uint*", &PID := 0)
    currentThreadID := DllCall("GetCurrentThreadId")
    if (threadID == currentThreadID) {
      DllCall("SetForegroundWindow", "Ptr", hWnd)
    } else {
      loop 10 {
        Run "`"" A_LineFile "\..\SetForeGroundWindow.exe`" " hWnd
        if (DllCall("GetForegroundWindow", "Ptr") == hWnd) {
          break
        }
        Sleep 10
        if (DllCall("GetForegroundWindow", "Ptr") == hWnd) {
          break
        }
      }
    }
  }
  static _activateDesktopBackground() {
    DllCall("SetForegroundWindow", "Ptr", WinExist("ahk_class Progman ahk_exe explorer.exe"))
  }
  static _getFirstWindowInVD(desktopNum, excludeHwnd := 0) {
    bak_DetectHiddenWindows := A_DetectHiddenWindows
    DetectHiddenWindows true
    returnValue := 0
    outHwndList := WinGetList()
    GUID_Desktop := Buffer(16)
    Desktops_Obj := this._GetDesktops_Obj()
    IVirtualDesktop := Desktops_Obj.GetAt(desktopNum)
    loop outHwndList.Length {
      theHwnd := outHwndList[A_Index] + 0
      if (theHwnd == excludeHwnd) {
        continue
      }
      arr_success_pView_hWnd := this._isValidWindow(theHwnd)
      if (arr_success_pView_hWnd[1] == 0) {
        pView := arr_success_pView_hWnd[2]
        OutputVar_MinMax := WinGetMinMax("ahk_id " theHwnd)
        if (!(OutputVar_MinMax == -1)) {
          HRESULT := DllCall(this.GetWindowDesktopId, "UPtr", this.IVirtualDesktopManager.Ptr, "Ptr", theHwnd, "Ptr", GUID_Desktop)
          if (!(HRESULT == 0)) {
            continue
          }
          DllCall(this.FindDesktop, "UPtr", this.IVirtualDesktopManagerInternal.Ptr, "Ptr", GUID_Desktop, "Ptr*", &IVirtualDesktop_ofWindow := 0)
          if (IVirtualDesktop_ofWindow == IVirtualDesktop) {
            returnValue := theHwnd
            break
          }
        }
      }
    }
    DetectHiddenWindows bak_DetectHiddenWindows
    return returnValue
  }
  static _tryGetValidWindow(wintitle) {
    bak_DetectHiddenWindows := A_DetectHiddenWindows
    bak_TitleMatchMode := A_TitleMatchMode
    DetectHiddenWindows true
    SetTitleMatchMode "2"
    outHwndList := WinGetList(wintitle)
    returnValue := false
    loop outHwndList.Length {
      theHwnd := outHwndList[A_Index] + 0
      arr_success_pView_hWnd := this._isValidWindow(theHwnd)
      pView := arr_success_pView_hWnd[2]
      if (pView) {
        returnValue := [arr_success_pView_hWnd[3], pView]
        break
      }
    }
    SetTitleMatchMode bak_TitleMatchMode
    DetectHiddenWindows bak_DetectHiddenWindows
    return returnValue
  }
  static _view_from_Hwnd(theHwnd) {
    pView := 0
    DllCall(this.GetViewForHwnd, "UPtr", this.IApplicationViewCollection.Ptr, "Ptr", theHwnd, "Ptr*", &pView := 0)
    return pView
  }
  static _IVirtualDesktop_from_Hwnd(theHwnd) {
    GUID_Desktop := Buffer(16)
    HRESULT := DllCall(this.GetWindowDesktopId, "UPtr", this.IVirtualDesktopManager.Ptr, "Ptr", theHwnd, "Ptr", GUID_Desktop)
    if (!(HRESULT == 0)) {
      return false
    }
    IVirtualDesktop_ofWindow := 0
    DllCall(this.FindDesktop, "UPtr", this.IVirtualDesktopManagerInternal.Ptr, "Ptr", GUID_Desktop, "Ptr*", &IVirtualDesktop_ofWindow := 0)
    return IVirtualDesktop_ofWindow
  }
  static _desktopNum_from_IVirtualDesktop(IVirtualDesktop) {
    Desktops_Obj := this._GetDesktops_Obj()
    loop Desktops_Obj.GetCount() {
      IVirtualDesktop_ofDesktop := Desktops_Obj.GetAt(A_Index)
      if (IVirtualDesktop_ofDesktop == IVirtualDesktop) {
        return A_Index
      }
    }
    return 0
  }
  static _desktopNum_from_Hwnd(theHwnd) {
    IVirtualDesktop := this._IVirtualDesktop_from_Hwnd(theHwnd)
    desktopNum := this._desktopNum_from_IVirtualDesktop(IVirtualDesktop)
    return desktopNum
  }
  static _GetDesktops_Obj() {
    IObjectArray := this._dll_GetDesktops()
    return this.IObjectArray_Wrapper(IObjectArray, this.Ptr_IID_IVirtualDesktop)
  }
  static _IsViewPinned(thePView) {
    viewIsPinned := 0
    DllCall(this.IsViewPinned, "UPtr", this.IVirtualDesktopPinnedApps.Ptr, "Ptr", thePView, "Int*", &viewIsPinned := 0)
    return viewIsPinned
  }
  static _isWindowFullScreen(winTitle) {
    winID := WinExist(winTitle)
    if (!winID)
      Return false
    style := WinGetStyle("ahk_id " WinID)
    WinGetPos , , &winW, &winH, winTitle
    Return ((style & 0x20800000) or winH < A_ScreenHeight or winW < A_ScreenWidth) ? false : true
  }
  static _isValidWindow(hWnd, checkUpper := true) {
    returnValue := [1, 0, 0]
    breakToReturnFalse:
    loop 1 {
      dwStyle := DllCall("GetWindowLongPtrW", "Ptr", hWnd, "Int", -16, "Ptr")
      if (!(dwStyle & 0x10000000)) {
        break breakToReturnFalse
      }
      dwExStyle := DllCall("GetWindowLongPtrW", "Ptr", hWnd, "Int", -20, "Ptr")
      if (!(dwExStyle & 0x00040000)) {
        if (dwExStyle & 0x00000080 || dwExStyle & 0x08000000) {
          break breakToReturnFalse
        }
        if (checkUpper) {
          toCheck := []
          upHwnd := hWnd
          while (upHwnd := DllCall("GetWindow", "Ptr", upHwnd, "Uint", 4)) {
            if (upHwnd == 65552) {
              break breakToReturnFalse
            }
            toCheck.Push(upHwnd)
          }
          i := toCheck.Length + 1
          while (i-- > 1) {
            arr_success_pView_hWnd := this._isValidWindow(toCheck[i], false)
            if (arr_success_pView_hWnd[1] == 0) {
              arr_success_pView_hWnd[1] := 2
              returnValue := arr_success_pView_hWnd
              break breakToReturnFalse
            }
          }
        }
      }
      pView := this._view_from_Hwnd(hWnd)
      if (!pView) {
        break breakToReturnFalse
      }
      pfCanViewMoveDesktops := 0
      DllCall(this.CanViewMoveDesktops, "UPtr", this.IVirtualDesktopManagerInternal.Ptr, "Ptr", pView, "int*", &pfCanViewMoveDesktops := 0)
      if (!pfCanViewMoveDesktops) {
        break breakToReturnFalse
      }
      returnValue := [0, pView, hWnd]
    }
    return returnValue
  }
  static _vtable(ppv, index) {
    Return NumGet(NumGet(0 + ppv, 0, "Ptr") + A_PtrSize * index, 0, "Ptr")
  }
  class IObjectArray_Wrapper {
    __New(IObjectArray, Ptr_IID_Interface) {
      this.IObjectArray := IObjectArray
      this.Ptr_IID_Interface := Ptr_IID_Interface
      this.Ptr_GetAt := VD._vtable(IObjectArray, 4)
    }
    __Delete() {
      Ptr_Release := VD._vtable(this.IObjectArray, 2)
      DllCall(Ptr_Release, "UPtr", this.IObjectArray)
    }
    GetAt(oneBasedIndex) {
      Ptr_Interface := 0
      DllCall(this.Ptr_GetAt, "UPtr", this.IObjectArray, "UInt", oneBasedIndex - 1, "Ptr", this.Ptr_IID_Interface, "Ptr*", &Ptr_Interface := 0)
      return Ptr_Interface
    }
    GetCount() {
      Ptr_GetCount := VD._vtable(this.IObjectArray, 3)
      Count := 0
      DllCall(Ptr_GetCount, "UPtr", this.IObjectArray, "UInt*", &Count := 0)
      return Count
    }
  }
}

package crc64bcce8c39838b345c;


public class CameraStateObserver
	extends java.lang.Object
	implements
		mono.android.IGCUserPeer,
		androidx.lifecycle.Observer
{
/** @hide */
	public static final String __md_methods;
	static {
		__md_methods = 
			"n_onChanged:(Ljava/lang/Object;)V:GetOnChanged_Ljava_lang_Object_Handler:AndroidX.Lifecycle.IObserverInvoker, Xamarin.AndroidX.Lifecycle.LiveData.Core\n" +
			"";
		mono.android.Runtime.register ("BarcodeScanning.CameraStateObserver, BarcodeScanning.Native.Maui", CameraStateObserver.class, __md_methods);
	}


	public CameraStateObserver ()
	{
		super ();
		if (getClass () == CameraStateObserver.class) {
			mono.android.TypeManager.Activate ("BarcodeScanning.CameraStateObserver, BarcodeScanning.Native.Maui", "", this, new java.lang.Object[] {  });
		}
	}


	public void onChanged (java.lang.Object p0)
	{
		n_onChanged (p0);
	}

	private native void n_onChanged (java.lang.Object p0);

	private java.util.ArrayList refList;
	public void monodroidAddReference (java.lang.Object obj)
	{
		if (refList == null)
			refList = new java.util.ArrayList ();
		refList.add (obj);
	}

	public void monodroidClearReferences ()
	{
		if (refList != null)
			refList.clear ();
	}
}

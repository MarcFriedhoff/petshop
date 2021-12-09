package Petshop_EEBoys;

// -----( IS Java Code Template v1.2

import com.wm.data.*;
import com.wm.util.Values;
import com.wm.app.b2b.server.Service;
import com.wm.app.b2b.server.ServiceException;
// --- <<IS-START-IMPORTS>> ---
// --- <<IS-END-IMPORTS>> ---

public final class utils

{
	// ---( internal utility methods )---

	final static utils _instance = new utils();

	static utils _newInstance() { return new utils(); }

	static utils _cast(Object o) { return (utils)o; }

	// ---( server methods )---




	public static final void longToString (IData pipeline)
        throws ServiceException
	{
		// --- <<IS-START(longToString)>> ---
		// @sigtype java 3.5
		// [i] object:0:required long
		// [o] field:0:required string
		// pipeline
		IDataCursor pipelineCursor = pipeline.getCursor();
		
		
		
		
			
		IDataUtil.put( pipelineCursor, "string", String.valueOf(IDataUtil.get( pipelineCursor, "long" )) );
		pipelineCursor.destroy();
		
			
		// --- <<IS-END>> ---

                
	}
}


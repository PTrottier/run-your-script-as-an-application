JsOsaDAS1.001.00bplist00�Vscript_D
ObjC.import('Foundation')

ObjC.import("Cocoa");

function openDocuments(droppedItems) {

	var array = []
    for (var item of droppedItems) {
		array.push('\"' + item.toString() + '\"')
    }
	
	app = Application.currentApplication();
	app.includeStandardAdditions = true;
	thePath = app.pathTo(this);
		
	var app = Application.currentApplication();
	app.includeStandardAdditions = true;

	var pipe = $.NSPipe.pipe
	var file = pipe.fileHandleForReading  // NSFileHandle
	var task = $.NSTask.alloc.init

	task.launchPath = '/bin/bash'
	task.environment = $({'PATH':JSON.stringify(['/Library/Frameworks/Python.framework/Versions/*/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin'])})
	task.arguments = ["-c", thePath.toString() + "/Contents/Resources/Scripts/main.py " + array.join(" ")]
	
	task.standardOutput = pipe  
	task.launch

}                              Zjscr  ��ޭ
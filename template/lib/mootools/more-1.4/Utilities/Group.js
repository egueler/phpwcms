(function(){this.Group=new Class({initialize:function(){this.instances=Array.flatten(arguments)},addEvent:function(type,fn){var instances=this.instances,len=instances.length,togo=len,args=new Array(len),self=this;instances.each(function(instance,i){instance.addEvent(type,function(){if(!args[i]){togo--}args[i]=arguments;if(!togo){fn.call(self,instances,instance,args);togo=len;args=new Array(len)}})})}})})();
package com.unhurdle.spectrum
{
  COMPILE::JS
  {
    import org.apache.royale.html.util.addElementToWrapper;
    import org.apache.royale.core.WrappedHTMLElement;
  }
  import org.apache.royale.html.List;
  [Event(name="itemClicked", type="org.apache.royale.events.ValueEvent")]
  public class Breadcrumbs extends org.apache.royale.html.List
  {
    public function Breadcrumbs()
    {
      super();
      typeNames = getSelector();
    }
    private function getSelector():String{
      return "spectrum-Breadcrumbs";
    }
    COMPILE::JS
    override protected function createElement():WrappedHTMLElement
    {
      var elem:WrappedHTMLElement = addElementToWrapper(this,'div');
      return elem;
    }
    private var _isTitle:Boolean;

    public function get isTitle():Boolean
    {
    	return _isTitle;
    }

    public function set isTitle(value:Boolean):void
    {
      if(value != !!_isTitle){
        if(value){
          className = getSelector() + "--title";
        } else {
          className = "";
        }
      }
      _isTitle = value;
    }
    private var _multiline:Boolean;

    public function get multiline():Boolean
    {
    	return _multiline;
    }

    public function set multiline(value:Boolean):void
    {
      if(value != !!_multiline){
        if(value){
          className = getSelector() + "--multiline";
        } else {
          className = "";
        }
      }
      _multiline = value;
    }
    private var _compact:Boolean;

    public function get compact():Boolean
    {
    	return _compact;
    }

    public function set compact(value:Boolean):void
    {
      if(value != !!_compact){
        if(value){
          className = getSelector() + "--compact";
        } else {
          className = "";
        }
      }
      _compact = value;
    }
  }
}

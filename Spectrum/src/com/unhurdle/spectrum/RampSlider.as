package com.unhurdle.spectrum
{
   COMPILE::JS{
        import org.apache.royale.html.util.addElementToWrapper;
        import org.apache.royale.core.WrappedHTMLElement;
    }
  public class RampSlider extends SliderBase
  {
    public function RampSlider()
    {
      super();
      typeNames =valueToSelector("ramp");
    }
    override protected function getSelector():String{
      return "spectrum-Slider";
    }
    COMPILE::JS
    private var handle:HTMLElement;
    COMPILE::SWF
    private var handle:Object;
 
    override protected function createElement():WrappedHTMLElement{
        var elem:WrappedHTMLElement = addElementToWrapper(this,'div');
        controlsContainer = newElement("div","spectrum-Slider-controls");
            var ramp:HTMLDivElement = newElement("div") as HTMLDivElement;
            ramp.className = "spectrum-Slider-ramp";
            var svgElement:SVGElement = document.createElementNS('http://www.w3.org/2000/svg', 'svg') as SVGElement;
            var pathElement:SVGPathElement = document.createElementNS('http://www.w3.org/2000/svg', 'path') as SVGPathElement;
            pathElement.setAttribute("d","M240,4v8c0,2.3-1.9,4.1-4.2,4L1,9C0.4,9,0,8.5,0,8c0-0.5,0.4-1,1-1l234.8-7C238.1-0.1,240,1.7,240,4z");
            svgElement.setAttribute("focusable",false);
            svgElement.setAttribute("viewBox","0 0 240 16");
            svgElement.setAttribute("preserveAspectRatio","none");
            svgElement.setAttribute("aria-hidden",true);
            svgElement.appendChild(pathElement);
            ramp.appendChild(svgElement);
            controlsContainer.appendChild(ramp);
            handle = newElement("div","spectrum-Slider-handle");
            handle.style.left = "40%"
        input = newElement("input","spectrum-Slider-input") as HTMLInputElement;
            input.type = "range";
            input.step = "2";
            input.onchange = handleChange();
            handle.appendChild(input);
            controlsContainer.appendChild(handle);
            elem.appendChild(controlsContainer);
    		element.addEventListener('mousedown', onMouseDown);
            return elem;
    }
    override protected function positionElements():void{
COMPILE::JS
			{
				var percent:Number = this.value / (max - min) * 100;
				handle.style.left = percent + "%";
			}
		}
    private function handleChange():void{
      displayValue = true;
			// if(valueNode){
			// 	valueNode.text = "" + value;
			// }
    }
    public function get value():Number
    {
    	return Number(input.value);
    }

    public function set value(value:Number):void
    {
      
			input.value = "" + value;
			if(parent){
				positionElements();
			}
			if(valueNode){
				valueNode.text = "" + value;
			}

    }
    override protected function onMouseMove(e:MouseEvent):void {
			var sliderOffsetWidth:Number = element.offsetWidth;
			var sliderOffsetLeft:Number = element.offsetLeft + (element.offsetParent as HTMLElement).offsetLeft;

			var x:Number = Math.max(Math.min(e.x-sliderOffsetLeft, sliderOffsetWidth), 0);
			var percent:Number = (x / sliderOffsetWidth) * 100;
			var val:Number = (max-min) / (100/percent);
			var stepVal:Number = step;
			var rem:Number = val % stepVal;
			val = val - rem;
			if (rem > (stepVal/2)){
		    val += stepVal;
			}
			value = val;
    }
  }
}
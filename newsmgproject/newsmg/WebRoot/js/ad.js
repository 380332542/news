 window.onload=function(){
            autoMove('img','span');
        }
        //ÂÖ²¥Í¼
        function autoMove(tagImg,tagSpan){
            var imgs=document.getElementById("main").getElementsByTagName(tagImg);
            var spans=document.getElementById("main").getElementsByTagName(tagSpan);
            function InitMove(index){
                for(var i=0;i<imgs.length;i++){
                    imgs[i].style.opacity='0';
                    spans[i+1].style.background='#ccc';
                }
                var times=(imgs[index].getAttribute("alt"))*1000;
                setTimeout(fMove,times);
                imgs[index].style.opacity='1';
                spans[index+1].style.background='black';
            }
            InitMove(0);
            var count=1;
            function fMove(){
                if(count==imgs.length){
                    count=0;
                }
 
                InitMove(count);
                
                count++;
            }
           
        }
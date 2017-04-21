 window.onload=function(){
            autoMove('img','span');
        }
        //轮播图
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
            /*
            var num=0;
            var times=1000;
            function ftimes(){
                if(num==imgs.length){
                    num=0;
                }
                times=(imgs[num].getAttribute("alt"))*1000;       
                num++;
                return times;
            }

            var scollMove=setInterval(fMove,ftimes);
             */
            //点击移动图片；
            /*这里就是点击左右移动的button来让图片根据用户的点击左右移动；需要注意一点就*是每次点击左移动或右移动需要首先清除定时器，等移动完了在重新添加定时器不然的*话你点击移动后图片虽然该变了，但是由于定时器还没移动到这张图片上面，所以就需*要等待定时器移动到你移动到的那张图片上面让后才开始定时轮播。比如如果你从开始
            *就点击移动图片，一直移动到最后一张那么你就要等待两个定时器的时间才能看到自动*轮播。
           
            var btnleft=document.getElementById('btnleft');
            var btnright=document.getElementById('btnright');
            btnleft.onclick=function(){
                clearInterval(scollMove);
                if(count==0){
                    count=imgs.length;
                }
                count--;
                InitMove(count);
                scollMove=setInterval(fMove,2500);
            };
            btnright.onclick=function(){
                clearInterval(scollMove);
                fMove();
                scollMove=setInterval(fMove,2500);
            }
            */
        }
 window.onload=function(){
            autoMove('img','span');
        }
        //�ֲ�ͼ
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
            //����ƶ�ͼƬ��
            /*������ǵ�������ƶ���button����ͼƬ�����û��ĵ�������ƶ�����Ҫע��һ���*��ÿ�ε�����ƶ������ƶ���Ҫ���������ʱ�������ƶ�������������Ӷ�ʱ����Ȼ��*�������ƶ���ͼƬ��Ȼ�ñ��ˣ��������ڶ�ʱ����û�ƶ�������ͼƬ���棬���Ծ���*Ҫ�ȴ���ʱ���ƶ������ƶ���������ͼƬ�����ú�ſ�ʼ��ʱ�ֲ������������ӿ�ʼ
            *�͵���ƶ�ͼƬ��һֱ�ƶ������һ����ô���Ҫ�ȴ�������ʱ����ʱ����ܿ����Զ�*�ֲ���
           
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
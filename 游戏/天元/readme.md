《计算与人工智能概论》期末大作业项目
项目名《ZERO：天元》
类型：游戏
米呼游詹姆斯·克拉克·麦克斯韦方程组工作室出品
 

故事背景：
弗兰大学研究生唐可可一日从寝室醒来，发现睡过头了，但全楼一片死寂。这时，一个电话打来……
唐可可是弗兰大学一名研究生，专攻生物信息学，目前在导师的实验室负责人工智能与模式识别，当然，因为导师的课题属于涉密项目，参与者很少，所以从图形图像处理到自然语言处理都是他一个人在干，他常常戏称自己是弗兰大学病毒学课题组里计算机学得最好的。导师的项目与学校的超算中心有合作，这样他也可以进入层层设防的中心内部，一睹当时最先进的超级计算机“天河”的风采，当然，还有机会接近基于强大算力的顶尖人工智能——“天元（ZERO）”。
 
弗兰大学：星沙市综合性大学，从考古学到生物学无所不包，还有全国最强超算中心，和那台著名的“天河”。当然，更让人感兴趣的是名为“天元”的人工智能，有风声道，“天元”在图灵测试中表现“相当优异”。在击败著名人工智能AlphaGO之后，“天元”宣判了深度学习的死刑，将众人的目光由卷积神经网络炼丹转向生命科学与人工智能交叉领域。21世纪，生命科学的时代到来了。
 
考古系将最新发现的奥陶纪化石转交给了超算中心，希望基因测序可以解析其中发现的病毒“奥陶琵斯”。当然，这是对外发布的说法。也有人说，在超算中心的地下有着迷宫般复杂而庞大的生物实验室，而“始祖病毒”奥陶琵斯，正是这座地下基地最深层的秘密。后来，这个人因散播谣言被拘留十日处理。
 
“‘始祖’是一种非常罕见的病毒，令人难以置信，仿佛天工造物，精妙绝伦，在细胞分裂的逆向工程中有着超越已知科学的效果，宛若神迹。或许这是上帝给人类的恩赐。”——美国著名生物学家威斯克在《Nature》上如此称赞道。
据说，每一项对于“奥陶琵斯”的研究都能轻易在《N》&《S》上发表，所以一时国内外生化环材学者均涌向弗兰大学，希望得到化石样本。不过很快，对于化石的研究被列入绝密项目，而样本也被移送到同样颇负盛名的超算中心。

游戏玩法：操纵人物在地图移动，探索看似平静的校园之下隐藏的秘密。
 
 
 
功能实现：unity游戏引擎，python，AE,PR，Ubuntu
核心玩法：文字解密，走剧情探索
辅助玩法：pygame作为主角在地下世界闯关时的解密，以游戏的形式代替枯燥的密码解谜。
项目地址：
Algernon98/pygame-in-HNU: python project in HuNan University (github.com)
图像处理：图片素材使用python代码对其像素化，作为地图素材，已被封装好可以直接调用程序。
人脸识别：openCV作为人脸识别资源库，代码在linux环境下可以调用摄像头对人脸识别，可以嵌入游戏中，作为“天元”boss房的 进入验证，可以增加沉浸感。

解密功能：采用MINST数据集，依照故事背景，黑客出身的主角可以破解地下基地的系统门禁。我们在IRIS鸢尾花数据集、波士顿房价数据集等知名机器学习数据集中选择手写数字识别，以其深度学习“Hello World”的称号，呼应“天元”这一哲学与棋道双重含义。
 
 
详情可见博客：
【Python机器学习基础教程】（三）_仿生程序员会梦见电子羊吗的博客-CSDN博客 

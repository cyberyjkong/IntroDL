% ============================================================
% template.cls - LaTeX 教程类模板
% 维护者：https://github.com/DanielXYZJohnson
% 日期：2026/04/06 v0.7
% ============================================================

% --- 定义 TeX 版本需求 ---
\NeedsTeXFormat{LaTeX2e}
% --- 定义类名称与版本信息 ---
\ProvidesClass{template}[2026/01/07 v0.4 Template Class for Technical Books]

% ============================================================
% 1. 基础类加载与宏包加载
% ============================================================
% 加载基础 book 类
% twoside: 双面排版模式（奇偶页页边距不同）
% openany: 新章节 (Chapter) 允许在任意页（奇数或偶数页）开始
\LoadClass[twoside,openany]{book}

% --- 中文与字体编码 ---
\RequirePackage[UTF8]{ctex}             % 中文支持 (UTF8编码)
\RequirePackage{fontsize}               % 字号精确控制
\RequirePackage{xeCJKfntef}             % CJK 字体特效支持
\RequirePackage[normalem]{ulem}         % 下划线与删除线支持 (normalem 避免修改默认emph)
\RequirePackage{fvextra}                % 增强型逐字环境 (支持自动换行)

% --- 页面布局与装饰 ---
\RequirePackage{geometry}               % 页面尺寸与边距设置
\RequirePackage{fancyhdr}               % 自定义页眉页脚
\RequirePackage{titlesec}               % 自定义章节标题格式
\RequirePackage{titletoc}               % 自定义目录样式
\RequirePackage{setspace}               % 行距控制

% --- 数学与逻辑 ---
\RequirePackage{amsmath,amsfonts,amssymb} % AMS 数学公式库与符号库
\RequirePackage{etoolbox}                 % 编程逻辑工具 (提供 patch 等功能)
\allowdisplaybreaks

% --- 图形、表格与浮动体 ---
\RequirePackage{graphicx}               % 图片插入支持
\RequirePackage{xcolor}                 % 颜色支持
\RequirePackage{tikz}                   % 绘图引擎
\RequirePackage{float}                  % 浮动体控制 (支持 [H] 强制位置)
\RequirePackage{caption}                % 图表标题格式自定义
\RequirePackage{subcaption}             % 支持子图 (subfigure)
\RequirePackage{booktabs}               % 专业三线表 (toprule, midrule, bottomrule)
\RequirePackage{array}                  % 表格列格式扩展
\RequirePackage{longtable}              % 跨页长表格支持
\RequirePackage{multirow}               % 表格多行合并
\RequirePackage{makecell}               % 表格单元格内换行支持
\RequirePackage{adjustbox}

% --- 列表与代码 ---
\RequirePackage{enumitem}               % 列表环境定制 (itemize, enumerate)
\RequirePackage{listings}               % 代码抄录与高亮
\RequirePackage[most]{tcolorbox}        % 彩色文本框引擎
\tcbuselibrary{breakable}               % 启用 tcolorbox 跨页功能

% --- 交互与链接 ---
\RequirePackage{hyperref}               % PDF 超链接、书签与元数据

% --- 绘图 ---
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.18} % 确保使用较新的特性，渲染更平滑

% \RequirePackage{lua-ul}                 % LuaLaTeX 专用高亮包
% \RequirePackage{luacolor}               % 修复高亮变黑的问题

\RequirePackage{xspace}
% 告诉 xspace 遇到这些中文后置标点时，千万不要加空格
\xspaceaddexceptions{，。、？！：；”’）】》〉…}
\RequirePackage{footnotehyper} % 解决盒子/环境内脚注无法跑到页脚的问题

% ============================================================
% 2. 颜色定义
% ============================================================
% --- 核心主题色 ---
\definecolor{red}{RGB}{220,60,60}             % 红色
\definecolor{winered}{rgb}{0.5,0,0}           % 酒红
\definecolor{orange}{RGB}{255,102,0}          % 橙色
\definecolor{yellow}{RGB}{255,255,200}        % 黄色
\definecolor{green}{RGB}{0,128,0}             % 绿色
\definecolor{blue}{RGB}{0,102,204}            % 蓝色
\definecolor{purple}{RGB}{128,0,128}          % 紫色
\definecolor{cyan}{RGB}{0,150,150}            % 青色
\definecolor{crimson}{RGB}{180,20,20}         % 深红

% --- 辅助色系 ---
\definecolor{lightgray}{RGB}{245,245,245}     % 浅灰
\definecolor{darkgray}{RGB}{128,128,128}      % 深灰
\definecolor{black}{RGB}{0,0,0}               % 纯黑
\definecolor{codebg}{RGB}{248,248,248}        % 代码背景灰
\definecolor{codeborder}{RGB}{204,204,204}    % 代码边框灰
\definecolor{inlineRed}{RGB}{199,37,78}       % 紫红色

% --- 行内徽章 / 代码标签配色 (仿截图浅蓝高亮质感) ---
\definecolor{codebadgebg}{RGB}{236,244,253}       % 浅冰蓝背景色
\definecolor{codebadgeborder}{RGB}{182,212,238}   % 柔和淡天蓝边框
\definecolor{codebadgetext}{RGB}{24,88,138}       % 沉稳深青蓝字色

% ============================================================
% 3. 页面尺寸设置
% ============================================================
% 设定为 16开 标准尺寸 (185mm x 260mm)
\geometry{
    paperwidth=185mm,     % 纸张宽度
    paperheight=260mm,    % 纸张高度
    left=1.8cm,           % 内侧边距 (装订侧)
    right=1.8cm,          % 外侧边距 (翻口侧)
    top=2.0cm,            % 上边距
    bottom=2.0cm,         % 下边距
    % bindingoffset=0.6cm,  % 装订线
    headheight=16pt,      % 页眉区域高度
    headsep=10pt,         % 页眉与正文距离
    footskip=20pt         % 页脚与正文距离
}

% ============================================================
% 4. 字体与段落排版
% ============================================================
% 正文: 五号(10.5pt), 行距 1.25倍 (10.5 * 1.25 = 13.125pt)
\renewcommand{\normalsize}{\fontsize{10.5pt}{13.125pt}\selectfont}

% 一级标题 (Chapter): 三号 (16pt)
\newcommand{\fontChapter}{\fontsize{16pt}{20pt}\bfseries\selectfont}
% 二级标题 (Section): 四号 (14pt)
\newcommand{\fontSection}{\fontsize{14pt}{17.5pt}\bfseries\selectfont}
% 三级标题 (Subsection): 小四 (12pt)
\newcommand{\fontSubsection}{\fontsize{12pt}{15pt}\bfseries\selectfont}

% 图表标题：小号加粗
\newcommand{\fontCaption}{\small\bfseries\color{black}}
% 表格内部：小五号
\newcommand{\fontTableContent}{\fontsize{9pt}{11pt}\selectfont}
% 代码内容：等宽字体
\newcommand{\fontCode}{\ttfamily\fontsize{9.5pt}{9pt}\selectfont}

% 段落设置
\setlength{\parskip}{0pt}       % 段间距归零 (由行距控制)
\setlength{\parindent}{2em}     % 首行缩进 2字符

% ============================================================
% 5. 目录格式
% ============================================================
% Part 目录样式 (带颜色链接)
\titlecontents{part}[0pt]
  {\addvspace{12pt}\bfseries\large\hypersetup{linkcolor=blue}\color{blue}}    % 上方间距、字体、颜色
  {第\,\thecontentslabel\,部分\quad}        % 有编号时的标签格式
  {}                                        % 无编号时的格式
  {\hfill\contentspage}                     % 填充符和页码
  [\addvspace{5pt}]                         % 下方间距

% Chapter 目录样式 (带点指引线)
\titlecontents{chapter}[0pt]
  {\addvspace{2pt}\bfseries\hypersetup{linkcolor=blue}\color{blue}}     % 章节间距、字体、颜色
  {第\,\thecontentslabel\,章\quad}        % 标签格式：第X章
  {}                                      % 无编号时
  {\titlerule*[0.5pc]{.}\contentspage}    % 指引线(点)与页码

% Section 目录样式 (黑色，缩进)
\titlecontents{section}[4em]
  {\addvspace{2pt}\hypersetup{linkcolor=black}\color{black}}    % 黑色字体
  {\contentslabel{2.5em}}   % 标签占位宽度
  {}
  {\titlerule*[0.5pc]{.}\contentspage}

% Subsection 目录样式
\titlecontents{subsection}[6.5em]
  {\hypersetup{linkcolor=black}\color{black}}
  {\contentslabel{3.0em}}   % 标签占位宽度
  {}
  {\titlerule*[0.5pc]{.}\contentspage}

% 强制开启到小节 (subsection) 甚至小小节 (subsubsection) 的编号
\setcounter{secnumdepth}{3} 
% 希望目录里也能正常显示这些层级，顺便加上这句
\setcounter{tocdepth}{3}

% ============================================================
% 6. 页眉页脚设置
% ============================================================
\pagestyle{fancy}
\fancyhf{}      % 清空默认页眉页脚

% 定义页眉链接变量 (用于显示网址或书名)
% 先初始化为空，防止报错，具体内容由 main.tex 中的 \setlink 决定
\def\@linkurl{}
\def\@linktext{}
\newcommand{\setlink}[2]{\def\@linkurl{#1}\def\@linktext{#2}}

% --- 页眉设置 ---
% 偶数页 (左): 章节名
\fancyhead[CE]{\color{black}\small\leftmark}
% 奇数页 (右): 自定义链接/文本
\fancyhead[CO]{\color{black}\small\href{\@linkurl}{\@linktext}}
% --- 页脚设置 ---
% 居中显示页码
\fancyfoot[C]{\thepage}

% --- 分隔线设置 ---
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\headrule}{\color{black}\hrule width\headwidth height\headrulewidth}
\renewcommand{\footrulewidth}{0pt}      % 页脚线宽 (无)

% --- 特殊页码格式 ---
% plain 样式 (章节首页): 仅显示页脚页码
\fancypagestyle{plain}{
    \fancyhf{}
    \fancyfoot[C]{\thepage}
    \renewcommand{\headrulewidth}{0pt}
}

% 标记重定义 (去除默认的大写转换)
\renewcommand{\chaptermark}[1]{\markboth{第\,\thechapter\,章：#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\quad #1}}

% ============================================================
% 7. 章节标题格式
% ============================================================
% --- Part (部分) ---
\titleformat{\part}[display]
  {\normalfont\fontChapter\color{blue}\centering}     % 样式: 居中、蓝色、大字
  {第\,\thepart\,部分}          % 标签
  {0pt}                         % 标签与标题间距
  {\fontChapter\color{blue}}  % 标题内容样式

% --- Chapter (章) ---
\titleformat{\chapter}[hang]
  {\normalfont\fontChapter\color{blue}\linespread{1.5}\centering}
  {第\,\thechapter\,章\quad}
  {0pt}
  {\fontChapter\color{blue}}
\titlespacing*{\chapter}{0pt}{10pt}{20pt} % 缩进, 上间距, 下间距

% --- Section (节) ---
\titleformat{\section}
  {\normalfont\fontSection\color{blue}}
  {\thesection\quad}
  {0pt}
  {\fontSection\color{blue}}
\titlespacing*{\section}{0pt}{15pt}{10pt}

% --- Subsection (子节) ---
\titleformat{\subsection}
  {\normalfont\fontSubsection\color{blue}}
  {\thesubsection\quad}
  {0pt}
  {\fontSubsection\color{blue}}
\titlespacing*{\subsection}{0pt}{10pt}{6pt}

% --- Subsubsection (小小节) ---
\titleformat{\subsubsection}
  {\normalfont\normalsize\bfseries\color{blue}}
  {\thesubsubsection\quad}
  {0pt}
  {\normalsize\color{blue}}
\titlespacing*{\subsubsection}{0pt}{8pt}{4pt}


% ============================================================
% 8. 超链接设置
% ============================================================
\hypersetup{
    colorlinks=true,
    linkcolor=winered,        % 内部链接 (目录/引用) 颜色
    filecolor=winered,        % 文件链接颜色
    urlcolor=winered,         % 外部 URL 颜色
    citecolor=winered,        % 参考文献引用颜色
    bookmarksnumbered=true,   % 书签带编号
    bookmarksopen=true,       % 默认展开书签
    pdfstartview=Fit,         % 打开时适应页面
    pdfpagemode=UseOutlines   % 显示书签侧边栏
}

% 目录中的链接强制为黑色，避免眼花
\AtBeginDocument{\addtocontents{toc}{\protect\hypersetup{linkcolor=black}}}

% --- 智能交叉引用 (大幅提升写作效率) ---
% 注意：必须在 hyperref 之后加载！
% nameinlink 选项能让“图”、“表”这两个字也带有超链接颜色，点击范围更大
\RequirePackage[nameinlink]{cleveref} 

% 中文化本地设置
\crefname{figure}{图}{图}
\crefname{table}{表}{表}
\crefname{equation}{公式}{公式}
\crefname{chapter}{章}{章}
\crefname{section}{节}{节}
\crefname{subsection}{小节}{小节}

% 配置多个引用同时出现时的中文连词（例如：图1.1 和 图1.2）
\newcommand{\crefpairconjunction}{ 和 }
\newcommand{\crefmiddleconjunction}{、}
\newcommand{\creflastconjunction}{、以及 }

% ============================================================
% 9. 文本强调与内联样式
% ============================================================
% 粗体强调
% \textbf{...} 是 LaTeX 内置命令 (黑色粗体)，直接使用即可。
% 红色粗体
\newcommand{\redbf}[1]{\textcolor{red}{\textbf{#1}}}

% 斜体强调
% \textit{...} 是内置斜体，\emph{...} 是语义强调

% 背景高亮 - 支持换行
% 基于 LuaLaTeX 的背景高亮
% \newcommand{\highlight}[1]{\highLight[yellow]{#1}}

% 下划线 - 支持换行
\renewcommand{\underline}[1]{\uline{#1}}
% \renewcommand{\underline}[1]{\CJKunderline[thickness=0.5pt, skip=false]{#1}}
% 删除线 - 支持换行
\newcommand{\delete}[1]{\sout{#1}}
% \newcommand{\delete}[1]{\CJKsout{#1}}

% 行内代码样式优化与精准间距控制
\newcommand{\codeGap}{\hspace{0.2em}} % 统一的 0.2em 对称间隙
\newcommand{\smartRightGap}{\futurelet\@let@token\@check@punct}
\def\@check@punct{%
  \let\next\codeGap % 默认加间隙
  % --- 紧凑版标点判断逻辑 (建议在编辑器里折叠此段) ---
  \ifx\@let@token，\let\next\relax\fi \ifx\@let@token。\let\next\relax\fi
  \ifx\@let@token、\let\next\relax\fi \ifx\@let@token？\let\next\relax\fi
  \ifx\@let@token！\let\next\relax\fi \ifx\@let@token；\let\next\relax\fi
  \ifx\@let@token：\let\next\relax\fi \ifx\@let@token）\let\next\relax\fi
  \ifx\@let@token】\let\next\relax\fi \ifx\@let@token》\let\next\relax\fi
  \ifx\@let@token”\let\next\relax\fi \ifx\@let@token’\let\next\relax\fi
  \ifx\@let@token,\let\next\relax\fi \ifx\@let@token.\let\next\relax\fi
  \ifx\@let@token?\let\next\relax\fi \ifx\@let@token!\let\next\relax\fi
  \ifx\@let@token;\let\next\relax\fi \ifx\@let@token:\let\next\relax\fi
  \ifx\@let@token)\let\next\relax\fi \ifx\@let@token\@sptoken\let\next\relax\fi
  \next
}

% --- 全局重定义 \texttt ---
\let\oldtexttt\texttt 
\renewcommand{\texttt}[1]{%
    \leavevmode\codeGap%               % ★ 左边：固定给 0.2em 
    {\color{inlineRed}\fontCode #1}%
    \smartRightGap%                    % ★ 右边：智能判断 (遇标点贴合，遇汉字 0.15em)
}

% --- 行内徽章盒子 (固定字高与深度，完全对齐正文，不随字母变形) ---
\newtcbox{\codeTagBox}{
    on line,                           % 严格跟随正文基线
    arc=2pt,                           % 柔和微圆角
    boxrule=0.4pt,                     % 精细边框线宽
    colback=codebadgebg,               % 浅冰蓝底色
    colframe=codebadgeborder,          % 淡天蓝边框
    coltext=codebadgetext,             % 字体颜色
    left=2.2pt, right=2.2pt,           % 左右微留白
    top=2.5pt, bottom=0.8pt,           % 微调上下内边距：紧密贴合正文字高
    boxsep=0pt,                        % 清空默认外扩 padding
    fontupper=\fontCode,               % 代码等宽字体
    before upper={\vphantom{Ay}}       % ★ 核心：用 Ay 锁定最高上限与最底下限，彻底固定高度
}

% --- 内联代码命令 \code ---
\newcommand{\code}[1]{%
    \leavevmode\codeGap%               % 左侧智能间隙
    \codeTagBox{#1}%                   % 徽章主体
    \smartRightGap%                    % 右侧智能吸附标点
}

% ============================================================
% 10. 图片与浮动体设置 (统一管理)
% ============================================================
% --- 浮动体间距控制 (控制与正文之间的距离) ---
% 【图片上方的文字】到【图片】的距离
% 【Caption】到【图片下方的文字】的距离
\setlength{\intextsep}{5pt}
% 控制位于页面顶部/底部的浮动体与正文的距离
\setlength{\textfloatsep}{3pt}  % 页面顶部/底部的图表与文字的距离

% --- Caption (标题) 样式 ---
% 注册楷体供 caption 使用
\DeclareCaptionFont{kaishu}{\kaishu}

% Caption 样式
\captionsetup{
    font={small,stretch=1.25},       % 整体字体设置
    labelfont={bf,color=black},      % 标签 (如"图1.1") 样式
    textfont={color=black,kaishu},   % 标题文本样式
    labelsep=quad,                   % 分隔符 (空一格)
    singlelinecheck=true,            % 单行时自动居中
    position=bottom,                 % 默认位置在下方
    skip=3pt,                        % 标题与图形的间距
}
\captionsetup[table]{position=top}   % 表格标题强制在上方
% 核心修复：单独压榨图片标题下方的“流氓空白”！
\captionsetup[figure]{position=bottom, belowskip=-9pt}
% --- 核心修复：单独拉近表格底线与下方正文的距离 ---
\AtEndEnvironment{table}{\vspace{-6pt}}

% --- 图片插入命令 ---
% 带边框的图片
\newcommand{\boxedimage}[2][]{
  {
    \centering                    % 居中
    \setlength{\fboxrule}{0.5pt}  % 边框线宽
    \setlength{\fboxsep}{1pt}     % 边框内边距
    % \color{darkgray}\fbox{\adjincludegraphics[#1]{#2}}%
    \fcolorbox{darkgray}{white}{\adjincludegraphics[#1]{#2}}% 
    \par
  }
}

% 普通图片简化命令 (不带边框)
\newcommand{\image}[2][]{
  {
    \centering
    \includegraphics[#1]{#2}
    \par
  }
}

% ============================================================
% 11. 表格设置
% ============================================================
% 线条与行高
\setlength{\heavyrulewidth}{1pt}   % 粗线宽 (顶部/底部线)
\setlength{\lightrulewidth}{0.5pt} % 细线宽 (中间线)
\setlength{\cmidrulewidth}{0.5pt}  % 局部横线宽
\setlength{\tabcolsep}{6pt}        % 列间距
\renewcommand{\arraystretch}{1.1}  % 行高系数 (紧凑舒适)

% 表格内自动应用字体
\AtBeginEnvironment{table}{\fontTableContent\centering}
\AtBeginEnvironment{tabular}{\fontTableContent}
\AtBeginEnvironment{longtable}{\fontTableContent}

% 长表格前后间距
\setlength{\LTpre}{5pt}
\setlength{\LTpost}{5pt}

% makecell 宏包配置 (表头样式)
\renewcommand{\theadalign}{bc}      % 底部居中对齐
\renewcommand{\theadfont}{\bfseries\color{black}} % 表头黑体加粗

% 表头加粗辅助命令
\newcommand{\firstrowbf}[1]{\textbf{#1}}

% ============================================================
% 12. 自定义提示框 (tcolorbox)
% ============================================================
% % 橙色强调框 (带标题风格)
% \newtcolorbox{orangeBox}[1]{
%     enhanced,
%     colback=orange!5,         % 内容背景
%     colframe=orange!85!black, % 边框颜色
%     colbacktitle=orange!85!black, % 标题背景
%     coltitle=white,           % 标题文字色
%     boxrule=0.8pt,
%     arc=3pt,                  % 圆角
%     fonttitle=\bfseries,      % 标题字体
%     title={#1},               % 标题参数
%     left=6pt, right=6pt,
%     top=4pt, bottom=4pt,
%     before skip=8pt,          % 外部间距 8 pt
%     after skip=8pt,           % 外部间距 8 pt
%     before upper={\setlength{\parindent}{2em}},   % 正文首行缩进两个字符
%     breakable=true
% }

% % 紫色提示框 (带标题风格)
% \newtcolorbox{purpleBox}[1]{
%     enhanced,
%     colback=purple!5,
%     colframe=purple!85!black,
%     colbacktitle=purple!85!black,
%     coltitle=white,
%     boxrule=0.8pt,
%     arc=3pt,
%     fonttitle=\bfseries,
%     title={#1},
%     left=6pt, right=6pt,
%     top=4pt, bottom=4pt,
%     before skip=8pt,          % 外部间距 8 pt
%     after skip=8pt,           % 外部间距 8 pt
%     before upper={\setlength{\parindent}{2em}},   % 正文首行缩进两个字符
%     breakable=true
% }

% --- 橙色悬浮框 ---
\newtcolorbox{orangeBox}[1]{
    enhanced,
    breakable,
    colback=orange!5,                % 内容背景：极浅橙色
    colframe=orange!85!black,        % 边框颜色
    boxrule=0.6pt,                   % 边框细度
    arc=3pt,                         % 盒子圆角
    fonttitle=\bfseries,             % 标题字体加粗
    coltitle=white,                  % 标题文字色
    title={#1},                      % 标题内容
    % 核心：将标题框挂在左侧，并向下偏移一半高度以实现悬浮效果
    attach boxed title to top left={xshift=15pt, yshift*=-\tcboxedtitleheight/2},
    boxed title style={
        colback=orange!85!black,     % 标题框背景色
        arc=3pt,                     % 标题框圆角
        boxrule=0.6pt,
    },
    left=6pt, right=6pt,
    top=4pt, bottom=4pt,             % 增加顶部间距以防标题遮挡内容
    before skip=12pt,                % 悬浮框建议外部间距略微加大
    after skip=8pt,
    before upper={\setlength{\parindent}{2em}},   % 正文首行缩进两个字符
    breakable=true
}

% --- 紫色悬浮框 ---
\newtcolorbox{purpleBox}[1]{
    enhanced,
    breakable,
    colback=purple!5,                % 内容背景：极浅紫色
    colframe=purple!85!black,        % 边框颜色
    boxrule=0.6pt,
    arc=3pt,
    fonttitle=\bfseries,
    coltitle=white,
    title={#1},
    % 核心：保持一致的 xshift 和 yshift
    attach boxed title to top left={xshift=15pt, yshift*=-\tcboxedtitleheight/2},
    boxed title style={
        colback=purple!85!black,
        arc=3pt,
        boxrule=0.6pt,
    },
    left=6pt, right=6pt,
    top=4pt, bottom=4pt,
    before skip=12pt,
    after skip=8pt,
    before upper={\setlength{\parindent}{2em}},   % 正文首行缩进两个字符
    breakable=true
}

% 青色悬浮框
\newtcolorbox{cyanBox}[1]{
    enhanced,
    breakable,
    colback=cyan!5,                 % 主体背景：极浅青色
    colframe=cyan!80!black,         % 边框颜色
    boxrule=0.6pt,                  % 边框细度
    arc=3pt,                        % 盒子圆角 3pt
    fonttitle=\bfseries\selectfont, % 标题字体
    coltitle=white,                 % 标题文字颜色
    title={#1},                     % 标题内容
    % --- 核心：将标题框挂在顶部正中间 ---
    % attach boxed title to top center={yshift*=-\tcboxedtitleheight/2},
    % 偏左，而不是正中间
    attach boxed title to top left={xshift=15pt, yshift*=-\tcboxedtitleheight/2},
    boxed title style={
        colback=cyan!80!black,     % 标题框背景色（实色）
        arc=3pt,                   % 标题框圆角 3pt
        boxrule=0.6pt,
    },
    left=6pt, right=6pt,
    top=4pt, bottom=4pt,
    before skip=8pt,          % 外部间距 8 pt
    after skip=8pt,           % 外部间距 8 pt
    before upper={\setlength{\parindent}{2em}},   % 正文首行缩进两个字符
    breakable=true
}

% 深红悬浮框
\newtcolorbox{crimsonBox}[1]{
    enhanced,
    breakable,
    colback=crimson!5,              % 主体背景：极浅红色
    colframe=crimson!80!black,      % 边框颜色
    boxrule=0.6pt,
    arc=3pt,
    fonttitle=\bfseries\selectfont,
    coltitle=white,
    title={#1},
    % --- 核心：将标题框挂在顶部正中间 ---
    % attach boxed title to top center={yshift*=-\tcboxedtitleheight/2},
    % 偏左，而不是正中间
    attach boxed title to top left={xshift=15pt, yshift*=-\tcboxedtitleheight/2},
    boxed title style={
        colback=crimson!80!black,  % 标题框背景色
        arc=3pt,
        boxrule=0.6pt,
    },
    left=6pt, right=6pt,
    top=4pt, bottom=4pt,
    before skip=8pt,          % 外部间距 8 pt
    after skip=8pt,           % 外部间距 8 pt
    before upper={\setlength{\parindent}{2em}},   % 正文首行缩进两个字符
    breakable=true
}

% % ============================================================
% % 13. 代码环境设置
% % ============================================================
% % --- 定义现代代码配色 ---
% \definecolor{codebg}{RGB}{250,250,250}       % 极简浅灰背景
% \definecolor{codeborder}{RGB}{220,220,220}   % 柔和边框
% \definecolor{kwColor}{RGB}{170,9,130}        % 关键字：高级紫红
% \definecolor{strColor}{RGB}{33,144,33}       % 字符串：护眼绿
% \definecolor{comColor}{RGB}{140,140,140}     % 注释：浅灰 (不抢戏)
% \definecolor{numColor}{RGB}{170,170,170}     % 行号：极浅灰

% % --- 全局 listings 设置 (基础高亮引擎) ---
% \lstset{
%     % 基础字体
%     basicstyle=\fontCode, 
%     columns=fullflexible,           % 字符间距紧凑自然
%     keepspaces=true,                % 保证缩进不被吞
%     keywordstyle=\color{kwColor}\bfseries,   
%     commentstyle=\color{comColor}\itshape,  
%     stringstyle=\color{strColor},             
%     % --- 行号与边距设置 ---
%     numbers=left,                           % ★ 开启左侧行号
%     numberstyle=\fontCode\tiny\color{numColor}, % 行号样式：等宽、极小、浅灰
%     numbersep=8pt,                          % 行号与代码之间的距离
%     xleftmargin=1.75em,                     % ★ 整体向右推 1.75em，给行号腾出完美空间
%     % ----------------------
%     rulecolor=\color{codeborder},
%     backgroundcolor=\color{codebg},
%     showstringspaces=false,         % 隐藏空格符
%     breaklines=true,                % 自动换行
%     breakatwhitespace=true,         % 只在空格处换行
%     tabsize=4,                      % Tab宽度
%     aboveskip=0pt,                  % 外部间距完全交给 tcolorbox 控制
%     belowskip=0pt,
% }

% % --- 通用代码/文本框 (去标题、极简版) ---
% \newtcolorbox{codeBox}[1][]{
%     enhanced,
%     breakable,                % 支持跨页
%     colback=codebg,           % 背景色
%     colframe=codeborder,      % 边框色
%     boxrule=0.5pt,            % 边框粗细微调，更精致
%     arc=4pt,                  % 稍微圆润一点的圆角
%     % --- 内边距控制 ---
%     left=2pt,                 % 左边距调小 (因为 lstset 的 xleftmargin 已经撑开了行号)
%     right=6pt,                % 右侧留白防止代码贴边
%     top=3pt, bottom=3pt,      % 上下增加一点呼吸空间
%     fontupper=\fontCode,      
%     % --- 外部间距控制 ---
%     before skip=8pt,         % 与上方正文距离
%     after skip=8pt,          % 与下方正文距离
%     #1                        % 保留参数扩展性
% }

% ============================================================
% 13. 代码环境设置
% ============================================================
% --- 定义现代代码配色 ---
\definecolor{codebg}{RGB}{250,250,250}       % 极简浅灰背景
\definecolor{codeborder}{RGB}{220,220,220}   % 柔和边框
\definecolor{kwColor}{RGB}{170,9,130}        % 关键字：高级紫红
\definecolor{strColor}{RGB}{33,144,33}       % 字符串：护眼绿
\definecolor{comColor}{RGB}{140,140,140}     % 注释：浅灰 (不抢戏)
\definecolor{numColor}{RGB}{170,170,170}     % 行号：极浅灰

% --- 全局 listings 设置 (基础高亮引擎) ---
\lstset{
    basicstyle=\fontCode, 
    columns=fullflexible,           
    keepspaces=true,                
    keywordstyle=\color{kwColor}\bfseries,   
    commentstyle=\color{comColor}\itshape,  
    stringstyle=\color{strColor},             
    numbers=left,                           
    numberstyle=\fontCode\tiny\color{numColor}, 
    frame=l,                                % ★ 核心：在代码左侧画一条竖线
    rulecolor=\color{codeborder},           % 竖线的颜色 (和外部边框颜色一致)
    framesep=5pt,                           % 竖线到代码正文的距离
    numbersep=10pt,                         % 行号到代码正文的距离 (14-6=8pt，即行号在竖线左侧 8pt)
    xleftmargin=1.75em,                     % ★ 整体向右推 1.75em，给“行号+竖线”腾出足够空间
    % ----------------------
    backgroundcolor=\color{codebg},
    showstringspaces=false,
    breaklines=true,
    breakatwhitespace=true,
    tabsize=4,                      
    aboveskip=0pt,                  
    belowskip=0pt,
}

% --- 通用代码框 (极简纯净版，彻底移除标题栏) ---
\newtcolorbox{codeBox}{
    enhanced,
    breakable,                % 支持跨页
    colback=codebg,           % 背景色
    colframe=codeborder,      % 边框色
    boxrule=0.5pt,            % 边框粗细
    arc=4pt,                  % 圆角
    % --- 内边距控制 ---
    left=2pt, right=2pt,      % 左侧留给行号(lstset已控制)，右侧留白
    top=2pt, bottom=2pt,      % 上下增加一点呼吸空间
    fontupper=\fontCode,      % 自动应用等宽字体
    % --- 外部间距控制 ---
    before skip=6pt,         % 与上方正文距离
    after skip=6pt           % 与下方正文距离
}

% ============================================================
% 14. 数学公式优化
% ============================================================
% 允许数学公式跨页 (4 = 强制允许)
\allowdisplaybreaks[4]

% 调整公式与上下文的间距
\setlength{\abovedisplayskip}{3pt}      % 公式的上方间距
\setlength{\belowdisplayskip}{3pt}      % 公式的下方间距
% 短行特殊处理
\setlength{\abovedisplayshortskip}{3pt} % 短行上方间距
\setlength{\belowdisplayshortskip}{3pt} % 短行下方间距
% 多行公式内部间距
\setlength{\jot}{3pt}       % align 等环境中，行与行的间距

% 数学旁注小字命令
\newcommand{\mathnote}[1]{\noindent\textcolor{darkgray}{\footnotesize\itshape #1}}

% % ============================================================
% % 15. 列表样式设置
% % ============================================================
% % --- 无序列表 (itemize) ---
% \setlist[itemize]{
%     topsep=0pt,
%     partopsep=0pt,
%     parsep=0pt,
%     itemsep=0pt,
%     leftmargin=0pt,      % 第二行起回行顶格
%     itemindent=1.4em,    % = labelwidth+labelsep，把标签顶回左边界
%     labelwidth=0.9em,
%     labelsep=0.3em,
%     align=left
% }
% % 标签设置为红色
% \setlist[itemize,1]{label=\textcolor{red}{$\bullet$}}
% \setlist[itemize,2]{label=\textcolor{red}{$\circ$}}

% % --- 有序列表 (enumerate) ---
% \setlist[enumerate]{
%     topsep=0pt,
%     partopsep=0pt,
%     parsep=0pt,
%     itemsep=0pt,
%     leftmargin=0pt,      % 第二行起回行顶格
%     itemindent=2.0em,    % = labelwidth+labelsep，把编号顶回左边界
%     labelwidth=1.6em,    % 容纳"13."；若上百改2.2em，itemindent同步改2.7em
%     labelsep=0.3em,
%     align=right,         % 编号右对齐 → 小数点竖直对齐
%     font=\bfseries\color{red}
% }
% \setlist[enumerate,1]{label=\arabic*.}
% \setlist[enumerate,2]{label=(\alph*)}

% ============================================================
% 15. 列表样式设置
% ============================================================
% --- 无序列表 (itemize) ---
\setlist[itemize]{
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    leftmargin=0pt,      % 第二行起回行顶格
    itemindent=1.5em,    % = labelwidth+labelsep，把标签顶回左边界
    labelwidth=0.8em,
    labelsep=0.2em,
    align=left
}
% 自定义可调空心圆：line width 控制边框粗细，circle(2.2pt) 控制半径大小
\newcommand{\customCirc}{%
    \tikz[baseline=-0.65ex]\draw[purple, line width=0.8pt] (0,0) circle (2.0pt);%
}

% 标签改为自定义空心圆
\setlist[itemize,1]{label=\customCirc}
\setlist[itemize,2]{label=\scalebox{0.8}{\customCirc}} % 二级列表等比例缩小
% % 标签设置为紫色空心圆（呼应封面样式）
% \setlist[itemize,1]{label=\textcolor{purple}{$\circ$}}
% \setlist[itemize,2]{label=\textcolor{purple}{\footnotesize$\circ$}}

% --- 有序列表 (enumerate) ---
\setlist[enumerate]{
    topsep=0pt,
    partopsep=0pt,
    parsep=0pt,
    itemsep=0pt,
    leftmargin=0pt,      % 第二行起回行顶格
    itemindent=2.0em,    % = labelwidth+labelsep，把编号顶回左边界
    labelwidth=1.6em,    % 容纳"13."；若上百改2.2em，itemindent同步改2.7em
    labelsep=0.3em,
    align=right,         % 编号右对齐 → 小数点竖直对齐
    font=\bfseries\color{purple}  % 编号字体改为紫色粗体
}
\setlist[enumerate,1]{label=\arabic*.}
\setlist[enumerate,2]{label=(\alph*)}

% ============================================================
% 16. 引用环境定制 (Quote)
% ============================================================

% 覆盖默认的 quote 环境，采用类似 noteBox 的直角、左侧绿线风格
\renewenvironment{quote}
  {\savenotes\begin{tcolorbox}[
      enhanced, 
      breakable,                                % 允许跨页
      sharp corners,                            % 直角
      frame hidden,                             % 隐藏四周默认边框
      colback=green!5,                          % 极浅的绿色背景
      borderline west={3pt}{0pt}{green},        % 左侧粗绿线 (宽度3pt)
      left=8pt, right=6pt,                      % 左右内边距
      top=4pt, bottom=4pt,                      % 上下内边距
      before skip=5pt,                          % 保留适当的上方外部间距
      after skip=5pt,                           % 保留适当的下方外部间距
      fontupper=\color{black}\kaishu,           % 恢复楷体，文字颜色设为纯黑
      % ★ 核心：将框内的局部小页计数器重定向至正文全局脚注计数器
      before upper={%
        \let\c@mpfootnote\c@footnote            % 编号值与正文计数器同步自增
        \let\thempfootnote\thefootnote          % 编号格式继承正文的阿拉伯数字 (1, 2...)
        \let\thempfn\thefootnote
      }
  ]}
  {\end{tcolorbox}\spewnotes}

% ============================================================
% 17. 辅助功能
% ============================================================
% 无编号章节 (出现在目录)
\newcommand{\unnumberedchapter}[1]{
    \chapter*{#1}
    \markboth{#1}{}
    \addcontentsline{toc}{chapter}{#1}
}

% 强制 Part 从奇数页开始，并且背后空一页（不影响 Chapter）
\let\oldpart\part
\RenewDocumentCommand{\part}{s o m}{%
    % 强制翻到奇数页（确保 Part 标题打印在右侧）
    \cleardoublepage 
    % 正常输出 Part，保留星号和可选参数的功能
    \IfBooleanTF{#1}%
        {\oldpart*{#3}}% 如果有星号 (\part*{...})
        {\IfNoValueTF{#2}{\oldpart{#3}}{\oldpart[#2]{#3}}}% 处理有无中括号的情况
    % 排版完 Part 之后，再次强制翻到下一个奇数页！
    % 这会导致 Part 背面的偶数页变成绝对的空白页。
    \cleardoublepage 
}

% 确保章节另起一页（不再强制奇数页）
\renewcommand{\chapter}{%
    \clearpage
    \thispagestyle{plain}%
    \global\@topnum\z@
    \@afterindentfalse
    \secdef\@chapter\@schapter%
}

% 脚注格式自定义
\makeatletter
\long\def\@makefntext#1{
  \parindent=0pt
  \noindent
  \hb@xt@1.2em{\hss\@makefnmark\hspace{0.4em}}#1
}
\makeatother
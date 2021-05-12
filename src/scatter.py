#!/usr/bin/env python
import sys
import numpy as np
import matplotlib
import pylab
import random
from optparse import OptionParser

from matplotlib import rcParams
rcParams['font.family'] = 'Arial'

delim = '\t'
parser = OptionParser()

parser.add_option("--tick_line_length",
                  dest="tick_line_length",
                  type=float,
                  default=2,
                  help="Tick line width")

parser.add_option("--tick_line_width",
                  dest="tick_line_width",
                  type=float,
                  default=0.5,
                  help="Tick line width")

parser.add_option("--axis_line_width",
                  dest="axis_line_width",
                  type=float,
                  default=0.5,
                  help="Axis line width")

parser.add_option("--axis_label_size",
                  dest="axis_label_size",
                  type=int,
                  default=8,
                  help="Axis label font size")

parser.add_option("--tick_label_size",
                  dest="tick_label_size",
                  type=int,
                  default=8,
                  help="Axis tick label font size")

parser.add_option("--noxline",
                  dest="noxline",
                  action="store_true", 
                  default=False,
                  help="No X axsis line")

parser.add_option("--noyline",
                  dest="noyline",
                  action="store_true", 
                  default=False,
                  help="No Y axsis line")


parser.add_option("--noxticks",
                  dest="noxticks",
                  action="store_true", 
                  default=False,
                  help="No X axsis ticks")

parser.add_option("--noyticks",
                  dest="noyticks",
                  action="store_true", 
                  default=False,
                  help="No Y axsis ticks")

parser.add_option("--noxtick_labels",
                  dest="noxtick_labels",
                  action="store_true", 
                  default=False,
                  help="No X axsis labels")

parser.add_option("--noytick_labels",
                  dest="noytick_labels",
                  action="store_true", 
                  default=False,
                  help="No Y axsis labels")


parser.add_option("--xticks",
                  dest="xticks",
                  action="store_true", 
                  default=False,
                  help="No X axsis line")

parser.add_option("--no_x",
                  dest="no_x",
                  help="CSV of x tick lables")

parser.add_option("-l",
                  "--log_y",
                  action="store_true", dest="logy", default=False,
                  help="Use log scale for y-axis")

parser.add_option( "--log_x",
                  action="store_true", dest="logx", default=False,
                  help="Use log scale for x-axis")


parser.add_option("-a",
                  "--alpha",
                  dest="alpha",
                  type="float",
                  default="0.5",
                  help="Alpha value")

parser.add_option("-o",
                  "--output_file",
                  dest="output_file",
                  help="Data file")

parser.add_option("--title",
                  dest="title",
                  help="Plot title (title or title;size;location)")


parser.add_option("--x_label",
                  dest="x_label",
                  help="X axis label")

parser.add_option("--y_label",
                  dest="y_label",
                  help="Y axis label")

parser.add_option("--axhline",
                  dest="axhline",
                  help="Horizonal lines")

parser.add_option("--axvline",
                  dest="axvline",
                  help="Vertical lines")

parser.add_option("--y_min",
                  dest="min_y",
                  help="Min y value")

parser.add_option("--y_max",
                  dest="max_y",
                  help="Max y value")

parser.add_option("--x_min",
                  dest="min_x",
                  help="Min x value")

parser.add_option("--x_max",
                  dest="max_x",
                  help="Max x value")


parser.add_option("--line_style",
                  dest="line_style",
                  default=".",
                  help="Line style")

parser.add_option("--fig_x",
                  dest="fig_x",
                  type="int",
                  default=5,
                  help="Figure width")

parser.add_option("--fig_y",
                  dest="fig_y",
                  type="int",
                  default=5,
                  help="Figure height")

parser.add_option("-b",
                  action="store_true", 
                  default=False,
                  dest="black",
                  help="black background")

parser.add_option("--markeredgecolor",
                  dest="markeredgecolor",
                  default="black",
                  help="Marker Edge Color")

parser.add_option("--markerfacecolor",
                  dest="markerfacecolor",
                  default="black",
                  help="Marker Face Color")

parser.add_option("--trend",
                  action="store_true", 
                  default=False,
                  dest="trend",
                  help="Trend line")

parser.add_option("--ref_lines",
                  dest="ref_lines",
                  help="Refernece lines (CSV slope:intercept:style:color) ")

parser.add_option("--point_size",
                  dest="point_size",
                  type="float",
                  default=1,
                  help="Scatter point size (defualt 1)")



(options, args) = parser.parse_args()
if not options.output_file:
    parser.error('Output file not given')

X=[]
Y=[]
E=[]
for l in sys.stdin:
    #a = l.rstrip().split(delim)
    a = l.rstrip().split()
    if len(a) == 1:
        Y.append(float(a[0]))
    if len(a) == 2:
        X.append(float(a[0]))
        Y.append(float(a[1]))
    if len(a) == 3:
        X.append(float(a[0]))
        Y.append(float(a[1]))
        E.append(float(a[2]))


matplotlib.rcParams.update({'font.size': 12})
#fig = matplotlib.pyplot.figure(figsize=(options.fig_x,options.fig_y),dpi=300)
fig = 1
if options.black:
    fig = matplotlib.pyplot.figure(\
            figsize=(options.fig_x,options.fig_y),\
            dpi=300,\
            facecolor='black')
else:
    fig = matplotlib.pyplot.figure(\
            figsize=(options.fig_x,options.fig_y),\
            dpi=300)

fig.subplots_adjust(wspace=.05,left=.01,bottom=.01)

#ax = fig.add_subplot(1,1,1)
ax = 1
if options.black:
    ax = fig.add_subplot(1,1,1,facecolor='black')
else:
    ax = fig.add_subplot(1,1,1)

ax.spines['top'].set_visible(False)
ax.spines['right'].set_visible(False)

if options.black:
    ax.spines['bottom'].set_color('white')
    ax.spines['left'].set_color('white')
    ax.title.set_color('white')
    ax.yaxis.label.set_color('white')
    ax.xaxis.label.set_color('white')
    ax.tick_params(axis='x', colors='white')
    ax.tick_params(axis='y', colors='white')
ax.get_xaxis().tick_bottom()
ax.get_yaxis().tick_left()

ax.spines['bottom'].set_linewidth(options.axis_line_width)
ax.spines['left'].set_linewidth(options.axis_line_width)

p = None
if len(X) == 0:
    p = ax.plot(range(len(Y)),
                Y,
                options.line_style,
                markeredgecolor=options.markeredgecolor,
                markerfacecolor=options.markerfacecolor,
                linewidth=1)
elif len(E) == 0:
    p = ax.plot(X,Y,
                options.line_style,
                markeredgecolor=options.markeredgecolor,
                markerfacecolor=options.markerfacecolor,
                linewidth=1,
                alpha=options.alpha,
                ms=float(options.point_size))
else:
    p = ax.scatter(X, Y,
                   s=E,
                   alpha=options.alpha)
    #handles, labels = p.legend_elements(prop="sizes", alpha=0.6)
    #legend = ax.legend(handles, 
                       #labels,
                       #loc="upper right",
                       #title="Sizes")




#if len(E)!=0:
    #ax.errorbar(X,Y,yerr=E, linestyle="None", color='gray')

if options.logy:
    ax.set_yscale('log')

if options.logx:
    ax.set_xscale('log')

if ((options.max_y) and (options.min_y)):
    ax.set_ylim(float(options.min_y),float(options.max_y))

if ((options.max_x) and (options.min_x)):
    ax.set_xlim(float(options.min_x),float(options.max_x))

if options.noxtick_labels:
    ax.set_xticklabels([])
if options.noytick_labels:
    ax.set_yticklabels([])

if options.x_label:
    ax.set_xlabel(options.x_label, fontsize=options.axis_label_size)

if options.y_label:
    ax.set_ylabel(options.y_label, fontsize=options.axis_label_size)

if options.title:
    if ';' in options.title:
        text, size, loc = options.title.split(';')
        fontdict = {'fontsize':int(size)}
        ax.set_title(text, fontdict=fontdict, loc=loc)
    else:
        ax.set_title(options.title)
        
if options.trend:
    z = np.polyfit(X, Y, 1)
    p = np.poly1d(z)
    ax.plot(X,p(Y),'r--',color='black')


if options.axhline:
    for hv in [float(x) for x in options.axhline.split(",")]:
        ax.axhline(y=hv, lw=0.5, color='black')

if options.axvline:
    for hv in [float(x) for x in options.axvline.split(",")]:
        ax.axvline(x=hv, lw=0.5, color='black')

if options.xticks:
    matplotlib.pyplot.locator_params(axis = 'x', nbins = int(len(options.xticks.split(','))))
    ax.set_xticklabels(options.xticks.split(','), rotation=options.xrotation)

if options.ref_lines:
    for slope,intercept,style,color,weight in [x.split(':') for x in options.ref_lines.split(',')]:
        x_vals = np.array(ax.get_xlim())
        y_vals = float(intercept) + float(slope) * x_vals
        ax.plot(x_vals, y_vals, style, c=color, lw=float(weight))

if options.noxticks:
    ax.tick_params(axis='x', which='both',length=0)

if options.noyticks:
    ax.tick_params(axis='y', which='both',length=0)

if options.noxline:
    ax.spines['bottom'].set_visible(False)

if options.noyline:
    ax.spines['left'].set_visible(False)

ax.tick_params(axis='both',
               which='major',
               labelsize=options.axis_label_size,
               width=options.tick_line_width,
               length=options.tick_line_length)
if options.black:
    matplotlib.pyplot.savefig(options.output_file,bbox_inches='tight',\
            facecolor=fig.get_facecolor(),\
              transparent=True)
else:
    matplotlib.pyplot.savefig(options.output_file,bbox_inches='tight')

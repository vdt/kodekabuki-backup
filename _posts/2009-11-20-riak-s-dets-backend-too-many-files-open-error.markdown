--- 
layout: default
title: Riak's dets backend - too many files open error
tags: []

type: regular

---
I was playing with Riak yesterday and ran into this error on my Macbook running Snow Leopard:

<pre><code>
{
 {badmatch,{error,{{badmatch,{error,
 {file_error,"./dets-store/1392993748081016843912887106182707253109560705024",emfile}}},
                    [   {riak_vnode,init,1},
                        {gen_server2,init_it,6},
                        {proc_lib,init_p_do_apply,3}    ]}}
 },
 [{riak_vnode_master,get_vnode,2},
  {riak_vnode_master,handle_cast,2},
  {gen_server,handle_msg,5},
  {proc_lib,init_p_do_apply,3}]
}
</code></pre>

When using the dets storage backend, Riak seems to create/open a dets database file for each vnode (partition) in your ring. When there's only one node in your cluster, I'm guessing all the vnodes/partitions are owned by this node which results in a whole bunch of files being opened (under the dets-store folder you configured). In Snow Leopard, I'd to do `ulimit -n 8192` to increase the limit on the no. of fds a process could take. You probably won't notice this normally - I increased the partition size in the config file and hence ran into this problem.

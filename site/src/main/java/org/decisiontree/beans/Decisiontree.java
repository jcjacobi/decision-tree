package org.decisiontree.beans;

import org.onehippo.cms7.essentials.dashboard.annotations.HippoEssentialsGenerated;
import org.hippoecm.hst.content.beans.Node;
import java.util.List;
import org.hippoecm.hst.content.beans.standard.HippoBean;

@HippoEssentialsGenerated(internalName = "decisiontree:decisiontree")
@Node(jcrType = "decisiontree:decisiontree")
public class Decisiontree extends BaseDocument {
    @HippoEssentialsGenerated(internalName = "decisiontree:name")
    public String getName() {
        return getProperty("decisiontree:name");
    }

    @HippoEssentialsGenerated(internalName = "decisiontree:children")
    public List<HippoBean> getChildren() {
        return getLinkedBeans("decisiontree:children", HippoBean.class);
    }

    @HippoEssentialsGenerated(internalName = "decisiontree:content")
    public HippoBean getContent() {
        return getLinkedBean("decisiontree:content", HippoBean.class);
    }
}

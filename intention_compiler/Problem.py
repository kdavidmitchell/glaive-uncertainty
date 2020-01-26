import fluenttree
import PDDLPart
import re


class Problem(PDDLPart.PDDLPart):
    def __init__(self, raw_string):
        super().__init__(raw_string)
        for child in self.children:
            tokens = re.split(r'\s', child)
            identifier = tokens[0]
            if identifier == "problem":
                self.name = tokens[1]
            elif identifier == ":domain":
                self.dom_name = tokens[1]
            elif identifier == ":objects":
                self.objects = child
            elif identifier == ":init":
                self.init_state = PDDLPart.PDDLPart(child).children
            elif identifier == ":goal":
                self.goal = fluenttree.FluentTree(PDDLPart.find_child(child)[0])



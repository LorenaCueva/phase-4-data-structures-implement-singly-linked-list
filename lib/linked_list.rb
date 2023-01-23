require_relative './node'

class LinkedList

    attr_accessor :head

    def initialize
        @head = nil
    end

    def prepend(node)
        node.next_node = head
        self.head = node
    end

    def append(node)
        if head.nil?
            self.head = node
            return
        end

        last_node = head
        while last_node.next_node
            last_node = last_node.next_node
        end

        last_node.next_node = node
    end

    def delete_head
        if head
            self.head = self.head.next_node
        else return
        end
    end

    def delete_tail
        if head == nil 
            return
        elsif head.next_node == nil
            self.head = nil
        else
            last_node = head
            prev_node = nil
            while last_node.next_node
                prev_node = last_node
                last_node = prev_node.next_node 
            end
            prev_node.next_node = nil
        end
    end
    
    def add_after(index, node)
        last_node = head
        index - 1.times do
            last_node = last_node.next_node
        end
        if last_node.next_node == nil
            last_node.next_node = node
        else
            cont_node = last_node.next_node
            last_node.next_node = node
            node.next_node = cont_node
        end
    end

    def search(value)
        curr_node = head
        while curr_node
            return curr_node if curr_node.data == value
            curr_node = curr_node.next_node
        end
        nil
    end

end

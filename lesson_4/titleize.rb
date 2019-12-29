words = "the flintstones rock"
title = words.split(' ').map(&:capitalize!).join(' ')

p title


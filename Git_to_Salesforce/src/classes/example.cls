global class example implements iterable<Account>{
    global Iterator<Account> Iterator(){
        return new CustomIterable();
    }
}
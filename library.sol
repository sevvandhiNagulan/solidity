pragma solidity ^0.4.0;
contract libraryy{
    uint[] avail;
    uint endtime;
    uint c1;
    string s="S";
    struct lib{
       string[] bName;
        uint[] ISBN;
        string[] stu_name;
        uint[] roll_no;
    }
    mapping(string=>lib) map;
    mapping(uint=> mapping (string => uint)) a;
    function addBookDetails(string _bName,uint _ISBN,uint _avail) public{
        map[s].bName.push(_bName);
        map[s].ISBN.push(_ISBN);
        avail.push(_avail);
            return availPush(_ISBN,_bName,_avail);
    }
    function availPush(uint _Isbn,string _BName,uint _avail) private{
        for(uint i=0;i<map[s].ISBN.length;i++){
            a[_Isbn][_BName]=_avail;
        }
    }
    function search(uint num) public view returns(bool){
        for(uint i=0;i<map[s].ISBN.length;i++){
            if(num == map[s].ISBN[i]){
                return true;
            }
        }
    }
    function studentDetails(string _stu_name,uint _roll_no) public{
          map[s].stu_name.push(_stu_name);
            map[s].roll_no.push(_roll_no);
    }
    function Availability(uint num,string BName) public view returns(uint){
      require(a[num][BName] != 0);
          return a[num][BName];
    }
    function getBooks(uint roll,uint isbn,string BName) public returns(bool){
        for(uint i=0;i<map[s].roll_no.length;i++){
            if(roll== map[s].roll_no[i]){
                endtime=now+1 * 1 minutes;
                a[isbn][BName]=a[isbn][BName]-1;
                return true;
            }
        }
    }
    function returnBooks(uint isbn,string BName)public{
                 uint fine=1;
                 a[isbn][BName]=a[isbn][BName]+1;
                 if(now > endtime){
                     uint d=now - endtime;
                     uint t=d/60;
                     uint c1=t * fine;
                 }
    } 
    function fine() public view returns(uint){
        return c1;
    }
 }

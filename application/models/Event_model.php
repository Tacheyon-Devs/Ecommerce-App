<?php 
class Event_model extends CI_Model
{
    public function getEventOwner($id)
    {
        $this->db->select("*");
        $this->db->from("businesses");
        $this->db->where("id",$id);
        $query = $this->db->get()->result()[0];
        return $query;

    }
    public function getEvent($id)
    {
        $this->db->select("*");
        $this->db->from("events");
        $this->db->where("id",$id);
        $query = $this->db->get()->result()[0];
        return $query;

    }
    public function getNearByEvents($latitude,$longitude)
    {
        //To search by kilometers instead of miles, replace 3959 with 6371.
        $distance = 10;
        // $query = "SELECT *, (((acos(sin((".$latitude."*pi()/180)) * sin((`latitude`*pi()/180)) + cos((".$latitude."*pi()/180)) * cos((`latitude`*pi()/180)) * cos(((".$longitude."- `longitude`) * pi()/180)))) * 180/pi()) * 60 * 1.1515 * 1.609344) as distance FROM `events` WHERE distance <= ".$distance;
        // $query = "SELECT * , (3956 * 2 * ASIN(SQRT( POWER(SIN(( $latitude - latitude) *  pi()/180 / 2), 2) +COS( $latitude * pi()/180) * COS(latitude * pi()/180) * POWER(SIN(( $longitude - longitude) * pi()/180 / 2), 2) ))) as distance from `events` having  distance <= 10 order by distance";
        $query = "SELECT
        *, (
          6371 * acos (
            cos ( radians($latitude) )
            * cos( radians( latitude ) )
            * cos( radians( longitude ) - radians($longitude) )
            + sin ( radians($latitude) )
            * sin( radians( latitude ) )
          )
        ) AS distance
      FROM events
      HAVING distance <= 20
      ORDER BY distance;";
        $result =$this->db->query($query)->result();
        // $result= $this->db->get()->result();
        return $result;
    }
    public function createEvent($data,$path)
    { 
        $array = array
        (
            "name"=>$data->name,
            "description"=>$data->description,
            "location"=>$data->location,
            "venue"=>$data->venue,
            "time"=>$data->time,
            "eventImage"=>$data->eventImage,
            "ticketPrice"=>$data->ticketPrice,
            "eventImage"=>$path,
            "longitude"=>$data->longitude,
            "latitude"=>$data->latitude,
            "businessId"=>$data->businessId
        );
        $this->db->insert("events",$array);
        return $this->db->insert_id();
    }
    public function addTags($tag,$event)
    {
        $array = array
        (
            "tagId"=>$tag,
            "eventId"=>$event
        );
        $this->db->insert("eventtags",$array);
    }
    public function getTags()
    {
        $this->db->select('*');
        $this->db->from('tags');
        $query =$this->db->get();
        return $query->result();
    }
    
}
/*SELECT * FROM (
    SELECT *, 
        (
            (
                (
                    acos(
                        sin(( $LATITUDE * pi() / 180))
                        *
                        sin(( `latitud_fieldname` * pi() / 180)) + cos(( $LATITUDE * pi() /180 ))
                        *
                        cos(( `latitud_fieldname` * pi() / 180)) * cos((( $LONGITUDE - `longitude_fieldname`) * pi()/180)))
                ) * 180/pi()
            ) * 60 * 1.1515 * 1.609344
        )
    as distance FROM `myTable`
) myTable
WHERE distance <= $DISTANCE_KILOMETERS
LIMIT 15;*/
/* DISTANCE_MILES
--- $LATITUDE = the latitude of the start point e.g 7.08594109039762;
--- $LONGITUDE = the longitude of the start point e.g 286.95225338731285;
--- $DISTANCE_MILES = your radius of search in Miles e.g 150

SELECT * FROM (
    SELECT *, 
        (
            (
                (
                    acos(
                        sin(( $LATITUDE * pi() / 180))
                        *
                        sin(( `latitud_fieldname` * pi() / 180)) + cos(( $LATITUDE * pi() /180 ))
                        *
                        cos(( `latitud_fieldname` * pi() / 180)) * cos((( $LONGITUDE - `longitude_fieldname`) * pi()/180)))
                ) * 180/pi()
            ) * 60 * 1.1515
        )
    as distance FROM `myTable`
) myTable
WHERE distance <= $DISTANCE_MILES
LIMIT 15;*/